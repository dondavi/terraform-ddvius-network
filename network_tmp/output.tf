


output "nat_gateway_id" {
    value ="${aws_nat_gateway.NATGW.id}"
}
output "elastic_ip_id" {
  value = "${aws_eip.EIP.id}"
}

output "elastic_ip_public" {
  value = "${aws_eip.EIP.public_ip}"
}

output "elastic_ip_private" {
  value = "${aws_eip.EIP.private_ip}"
}


output "elastic_ip_private_associate" {
  value = "${aws_eip.EIP.associate_with_private_ip}"
}
/*
output "subnet_associate1" {
  value = "${aws_route_table_association.privateroutetableassociation1.id}"
}

output "subnet_associate2" {
  value = "${aws_route_table_association.privateroutetableassociation2.id}"
}

output "subnet_associate3" {
  value = "${aws_route_table_association.privateroutetableassociation3.id}"
}
*/