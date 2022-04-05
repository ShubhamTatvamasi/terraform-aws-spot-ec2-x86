resource "aws_network_interface" "second_interface" {
  count = 1

  subnet_id       = local.subnet_id

  security_groups = [
    module.local_vpc_sg.security_group_id
  ]

  attachment {
    instance     = module.ec2_instance.spot_instance_id
    device_index = 1
  }

  tags = local.tags
}
