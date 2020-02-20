
resource "aws_route_table" "defaultroutetable" {
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NATGW.id}"
  }
  tags = {
    Name = "DDVIUS_INT_NATG_RT"
  }
  depends_on = ["var.vpc_id","aws_nat_gateway.NATGW"]

  }

  
/*  resource "aws_main_route_table_association" "vpcmainroute" {
  vpc_id = "${var.vpc_id}"
  route_table_id = "${var.private_subnet1_id}"
}
*/
/*
resource "aws_route_table_association" "initialassoc1" {
 subnet_id = "${var.private_subnet1_id}"
 route_table_id ="${aws_route_table.route_table_id}"
}
resource "aws_route_table_association" "initialassoc2" {
   subnet_id = "${var.private_subnet2_id}"
  route_table_id ="${aws_route_table.route_table_id}"
}

resource "aws_route_table_association" "initialassoc3" {
   subnet_id = "${var.private_subnet3_id}"
  route_table_id ="${aws_route_table.route_table_id}"
}

*/


resource "aws_eip" "EIP" {
  vpc              = true
  tags = {
    Name = "DDVIUS_EIP_NATGW"
  }
}
resource "aws_nat_gateway" "NATGW" {
    allocation_id = "${aws_eip.EIP.id}"
    subnet_id = "${var.public_subnet_id}"

    tags = {
        Name  = "DDVIUS_NATGW"
    }
    depends_on = ["aws_eip.EIP", "var.public_subnet_id"]
  
}
/*
resource "aws_route_table" "PrivateNatRouteTable" {
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NATGW.id}"
  }
  tags = {
    Name = "DDVIUS_INT_NATG_RT"
  }

  depends_on = ["var.vpc_id","aws_nat_gateway.NATGW"]
  }

  // make first private subnet the main route for vpc

resource "aws_main_route_table_association" "vpcmainroutenat" {
  vpc_id         = "${var.vpc_id}"
  route_table_id = "${aws_route_table.PrivateNatRouteTable.id}"
}


resource "aws_route_table_association" "privateroutetableassociation1" {
  subnet_id      = "${var.private_subnet1_id}"
  route_table_id = "${aws_route_table.PrivateNatRouteTable.id}"
  depends_on = ["var.private_subnet1_id","aws_route_table.PrivateNatRouteTable"]
}

resource "aws_route_table_association" "privateroutetableassociation2" {
  subnet_id      = "${var.private_subnet2_id}"
  route_table_id = "${aws_route_table.PrivateNatRouteTable.id}"
  depends_on = ["var.private_subnet2_id","aws_route_table.PrivateNatRouteTable"]
}
resource "aws_route_table_association" "privateroutetableassociation3" {
  subnet_id      = "${var.private_subnet3_id}"
  route_table_id = "${aws_route_table.PrivateNatRouteTable.id}"
  depends_on = ["var.private_subnet3_id","aws_route_table.PrivateNatRouteTable"]
}
*/