provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "gitlab" {
  name         = "gitlab"
  zone    = "${var.zone}"
  machine_type = "${var.machine_type}"
  tags = ["gitlab-host", "default-allow-ssh"]

  boot_disk {
    initialize_params {
      image = "${var.vm_image}"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = "${google_compute_address.gitlab_ip.address}"
    }
  }

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "gitlab_ip" {
  name = "gitlab-external-ip"
}

resource "google_compute_firewall" "firewall_gitlab" {
  name = "allow-gitlab-host"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = "${var.gitlab_ports}"
  }

  source_ranges = "${var.gitlab_source_ranges}"
  target_tags = ["gitlab-host"]
}

resource "google_compute_firewall" "firewall_ssh" {
  name        = "default-allow-ssh"
  network     = "default"
  description = "Allow SSH connection"

  allow {
    protocol = "tcp"
    ports    = "${var.ssh_port}"
  }

  source_ranges = "${var.ssh_source_ranges}"
}

# DNS
resource "google_dns_managed_zone" "infra" {
  name     = "infra-zone"
  dns_name = "${var.infra_domain}."
}

resource "google_dns_record_set" "gitlab" {
  name = "gitlab.${google_dns_managed_zone.infra.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.infra.name}"

  rrdatas = ["${google_compute_address.gitlab_ip.address}"]
}
