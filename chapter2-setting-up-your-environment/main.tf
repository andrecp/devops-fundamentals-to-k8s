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

resource "digitalocean_droplet" "web" {
  image    = "ubuntu-20-04-x64"
  name     = "web-1"
  region   = "sfo3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [var.do_sshkey]
}
