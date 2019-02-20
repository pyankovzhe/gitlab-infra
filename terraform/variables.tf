variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west3"
}

variable zone {
  description = "Zone"
  default     = "europe-west3-c"
}

variable vm_image {
  description = "Base vm image for gitlab"
  default     = "ubuntu-1604-xenial-v20190212"
}

variable machine_type {
  description = "Machine type"
  default     = "n1-standard-1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}
variable gitlab_user {
  description = "Gitlab user"
}

variable gitlab_ports {
  description = "Ports of the firewall rule"
  default     = ["80", "443"]
}

variable gitlab_source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}

variable ssh_port {
  description = "ssh port of the firewall rule"
  default     = ["22"]
}

variable ssh_source_ranges {
  description = "Allowed IP addresses for ssh connections"
  default     = ["0.0.0.0/0"]
}

variable infra_domain {
  description = "Domain"
  default     = "example.test"
}

