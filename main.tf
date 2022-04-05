provider "aws" {
  region = "us-west-1"
}

resource "random_uuid" "ssh_key_uuid" {}

resource "aws_key_pair" "shubhamtatvamasi" {
  key_name   = "shubhamtatvamasi-key-${random_uuid.ssh_key_uuid.result}"
  public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_vpc" "default" {
  default = true
}

module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 4.0"

  name   = "ssh-security-group"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  vpc_id = data.aws_vpc.default.id
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Docker AGW x86 - 5.4 Kernal"

  create_spot_instance = true

  ami                    = "ami-075fd582acf0c0128" # Linux kernal 5.4.0-1009-aws - Ubuntu 20.04 LTS - us-west-1
  instance_type          = "t3a.medium"
  key_name               = aws_key_pair.shubhamtatvamasi.key_name
  monitoring             = true
  vpc_security_group_ids = [module.ssh_security_group.security_group_id]
  subnet_id              = "subnet-2674e740"

  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 50
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
