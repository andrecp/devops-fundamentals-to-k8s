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

resource "digitalocean_droplet" "server" {
  image    = "ubuntu-20-04-x64"
  name     = "server-1"
  region   = "sfo3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [var.do_sshkey]
}

output "public_ip" {
  value = digitalocean_droplet.server.*.ipv4_address
}
