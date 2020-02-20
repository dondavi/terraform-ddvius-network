resource aws_vpc "vpc" {
cidr_block= "10.0.0.0/16"
instance_tenancy="default"
enable_dns_support =true
enable_dns_hostnames = true

 tags=  {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_VPC"
     Owner="${var.owner_tag}"
 }
}
resource "aws_main_route_table_association" "vpc_main" {
  vpc_id         = "${aws_vpc.vpc.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}
resource aws_internet_gateway "igw" {
 vpc_id="${aws_vpc.vpc.id}"

 tags=  {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_IGW"
     Owner="${var.owner_tag}"
 }
}
