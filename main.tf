terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
  required_version = ">= 0.13"
}


provider "digitalocean" {
    token = "${var.token}"
}

resource "digitalocean_droplet" "web" {
    name  = "swarm1"
    image = "docker-18-04"
    region = "nyc1"
    size   = "s-1vcpu-1gb"
    user_data  = "${file("web.conf")}"
    ssh_keys = [
    "${var.ssh_keys}"
    ]
}


output "ip4" {
    value = "${digitalocean_droplet.web.ipv4_address}"
}