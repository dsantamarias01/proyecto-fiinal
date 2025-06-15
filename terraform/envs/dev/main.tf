provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "../../modules/network"
}

module "instances" {
  source = "../../modules/instances"
  key_name = "ssh-david-multimedia"
}
