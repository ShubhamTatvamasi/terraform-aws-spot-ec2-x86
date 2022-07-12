locals {
  # region = "us-west-1"
  region = "us-east-1"

  # subnet_id     = "subnet-2674e740" # us-west-1a
  subnet_id     = "subnet-dff8f092" # us-east-1a
  instance_type = "t3a.medium"
  volume_size   = 50

  # ami = "ami-075fd582acf0c0128" # Linux kernal 5.4.0-1009-aws - Ubuntu 20.04 LTS - us-west-1
  ami = "ami-01de8ddb33de7a3d3" # Linux kernal 5.4.0-1049-aws - Ubuntu 20.04 LTS - us-east-1

  tags = {
    Name        = "Docker AGW x86 - 5.4 Kernal"
    Environment = "dev"
  }
}
