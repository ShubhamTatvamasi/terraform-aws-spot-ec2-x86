locals {
  region = "us-west-1"

  subnet_id = "subnet-2674e740"
  instance_type = "t3a.medium"
  volume_size = 50

  ami = "ami-075fd582acf0c0128" # Linux kernal 5.4.0-1009-aws - Ubuntu 20.04 LTS - us-west-1

  tags = {
    Name        = "Docker AGW x86 - 5.4 Kernal"
    Environment = "dev"
  }
}
