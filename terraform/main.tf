provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

resource "google_compute_instance" "gitlab" {
  name         = "gitlab"
  machine_type = "${var.machine_type}"
  tags = ["gitlab"]

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.vm_image}"
    }
  }

  # определение сетевого интерфейса
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
  name = "allow-gitlab-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = "${var.firewall_ports}"
  }

  source_ranges = "${var.firewall_source_ranges}"
  target_tags = ["gitlab"]
}
