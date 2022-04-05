# resource "aws_network_interface" "second_interface" {
#   subnet_id       = local.subnet_id
#   security_groups = [
#     module.local_vpc_sg.security_group_id
#   ]
# }
