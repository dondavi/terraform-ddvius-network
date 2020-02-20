output "vpc" {
  value = "${aws_vpc.vpc}"
}
output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "domain_name" {
  value ="${aws_route53_zone.public_hz}"
}

output "certificate" {
  value = "${aws_acm_certificate.cert}"
}
output "private1_cidr_block"{
  value= "${aws_subnet.private1_subnet.cidr_block}"
}
output "private2_cidr_block"{
  value= "${aws_subnet.private2_subnet.cidr_block}"
}

output "private3_cidr_block"{
  value= "${aws_subnet.private3_subnet.cidr_block}"
}
output "public1_cidr_block"{
  value= "${aws_subnet.public1_subnet.cidr_block}"
}

output "public2_cidr_block"{
  value= "${aws_subnet.public2_subnet.cidr_block}"
}
output "public3_cidr_block"{
  value= "${aws_subnet.public3_subnet.cidr_block}"
}

output "public_nacl" {
    value = "${aws_network_acl.public_nacl.id}"
}

output "private_nacl" {
    value = "${aws_default_network_acl.private_nacl.id}"
}

output "public_route" {
    value = "${aws_route_table.public_rt.id}"
}
output "private_route" {
    value = "${aws_route_table.private_rt.id}"
}

output "public_securitygroup" {
  value ="${aws_security_group.public_sg.id}"
}

output "private_securitygroup" {
  value ="${aws_security_group.private_sg.id}"
}



