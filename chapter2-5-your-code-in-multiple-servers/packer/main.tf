variable "do_token" {}
variable "do_sshkey" {}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_image" "webapp" {
  name = "webapp-1"
}

resource "digitalocean_droplet" "server" {
  count    = 2
  image    = data.digitalocean_image.webapp.id
  name     = "server-${count.index}"
  region   = "sfo3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [var.do_sshkey]
}

output "public_ip" {
  value = digitalocean_droplet.server.*.ipv4_address
}
