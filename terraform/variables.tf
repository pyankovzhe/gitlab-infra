variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west3"
}

variable zone {
  description = "Zone"
  default     = "europe-west3-a"
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

variable firewall_ports {
  description = "Port of the firewall rule"
  default     = ["80", "2222", "443"]
}

variable firewall_source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}
