resource aws_route_table "public_rt" {
vpc_id="${aws_vpc.vpc.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

 tags = {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_EXT_ROUTE"
     Owner="${var.owner_tag}"
 }
 
  depends_on = ["aws_vpc.vpc","aws_internet_gateway.igw"]
}

resource "aws_route_table_association" "public_route_assoc1" {
  subnet_id      = "${aws_subnet.public1_subnet.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
  depends_on     = ["aws_subnet.public1_subnet","aws_route_table.public_rt"]
}
resource "aws_route_table_association" "public_route_assoc2" {
  subnet_id      = "${aws_subnet.public2_subnet.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
  depends_on     = ["aws_subnet.public2_subnet","aws_route_table.public_rt"]
}
resource "aws_route_table_association" "public_route_assoc3" {
  subnet_id      = "${aws_subnet.public3_subnet.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
  depends_on     = ["aws_subnet.public3_subnet","aws_route_table.public_rt"]
}

resource aws_route_table "private_rt" {
vpc_id="${aws_vpc.vpc.id}"

//route {
//    cidr_block = "10.0.0.0/16"
    //gateway_id = "${aws_internet_gateway.igw.id}"
//  }
 tags = {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_INT_DFLT_ROUTE"
     Owner="${var.owner_tag}"
 }
//  depends_on = ["aws_vpc.vpc","aws_nat_gateway.natgw"]
  depends_on = ["aws_vpc.vpc"]

}

resource "aws_route_table_association" "private_route_assoc1" {
  subnet_id      = "${aws_subnet.private1_subnet.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
  depends_on     = ["aws_subnet.private1_subnet","aws_route_table.private_rt"]
}

resource "aws_route_table_association" "private_route_assoc2" {
  subnet_id      = "${aws_subnet.private2_subnet.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
  depends_on     = ["aws_subnet.private2_subnet","aws_route_table.private_rt"]
}
resource "aws_route_table_association" "private_route_assoc3" {
  subnet_id      = "${aws_subnet.private3_subnet.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
  depends_on     = ["aws_subnet.private3_subnet","aws_route_table.private_rt"]
}

