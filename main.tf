# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

# according to this tutorial: 
# https://developer.hashicorp.com/terraform/tutorials/applications/digitalocean-provider

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# reads the DIGITALOCEAN_ACCESS_TOKEN env variable from system and enables access to the DO-Account
provider "digitalocean" {}

# see here for available values https://slugs.do-api.dev/
resource "digitalocean_droplet" "terramino" {
  image     = "ubuntu-23-10-x64"
  name      = "terramino"
  region    = "fra1"
  size      = "s-1vcpu-1gb"
  ssh_keys = [
    "4e:9f:83:c8:59:60:a5:cd:a1:51:35:aa:06:28:b9:81"
  ]
  user_data = file("cloud-init.yaml")
}

resource "digitalocean_record" "ugly" {
  domain = "hschaletzky.de"
  type   = "A"
  name   = "ugly"
  value  = digitalocean_droplet.terramino.ipv4_address
}
