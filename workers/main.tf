
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

resource "digitalocean_droplet" "web2" {
    name  = "swarm2"
    image = "docker-18-04"
    region = "nyc1"
    size   = "s-1vcpu-1gb"
    user_data  = "${file("web.conf")}"
    ssh_keys = [
    "${var.ssh_keys}"
    ]
}

resource "digitalocean_droplet" "web3" {
    name  = "swarm3"
    image = "docker-18-04"
    region = "nyc1"
    size   = "s-1vcpu-1gb"
    user_data  = "${file("web.conf")}"
    ssh_keys = [
    "${var.ssh_keys}"
    ]
}

resource "digitalocean_droplet" "web4" {
    name  = "swarm4"
    image = "docker-18-04"
    region = "nyc1"
    size   = "s-1vcpu-1gb"
    user_data  = "${file("web.conf")}"
    ssh_keys = [
    "${var.ssh_keys}"
    ]
}

output "ip" {
    value = "${digitalocean_droplet.web2.ipv4_address}"
}
output "ip2" {
    value = "${digitalocean_droplet.web3.ipv4_address}"
}
output "ip3" {
    value = "${digitalocean_droplet.web4.ipv4_address}"
}