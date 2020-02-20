resource aws_network_acl "public_nacl" {
  vpc_id="${aws_vpc.vpc.id}"
  ingress {
    protocol = "tcp"
    rule_no=100
    cidr_block = "0.0.0.0/0"
    action = "allow"
    from_port = 443
    to_port   = 443
  }
  egress {
    protocol="tcp"
    rule_no=100
    cidr_block = "0.0.0.0/0"
    action = "allow"
    from_port = 443
    to_port   = 443
  }
   tags= {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_PUBLIC_NACL"
     Owner="${var.owner_tag}"
   }
 }

resource aws_default_network_acl "private_nacl" {
  default_network_acl_id = "${aws_vpc.vpc.default_network_acl_id}"
   ingress {
    protocol = "tcp"
    rule_no=100
    cidr_block = "10.0.0.0/16"
    action = "allow"
    from_port = 443
    to_port   = 443
  }
  egress {
    protocol="tcp"
    rule_no=100
    cidr_block = "10.0.0.0/16"
    action = "allow"
    from_port = 443
    to_port   = 443
  }
   tags= {
     App = "${var.app_tag}"
     Name=  "${var.owner_tag}_PRIVATE_NACL"
     Owner="${var.owner_tag}"
 }
}