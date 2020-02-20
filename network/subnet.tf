resource aws_subnet "private1_subnet" {
 cidr_block= "${var.public_subnet1_cidr}"
 availability_zone= "${var.availzone_1}"
 vpc_id="${aws_vpc.vpc.id}"
  tags=  {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_PRIV1-${var.availzone_1}"
     Owner="${var.owner_tag}"
 }
}

resource aws_subnet "private2_subnet" {
 cidr_block="${var.public_subnet2_cidr}"
 availability_zone= "${var.availzone_2}"
 vpc_id="${aws_vpc.vpc.id}"
   tags=  {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_PRIV2-${var.availzone_2}"
     Owner="${var.owner_tag}"
 }
}
resource aws_subnet "private3_subnet" {
  cidr_block= "${var.public_subnet3_cidr}"
  availability_zone= "${var.availzone_3}"
  vpc_id="${aws_vpc.vpc.id}"
    tags=  {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_PRIV3-${var.availzone_3}"
     Owner="${var.owner_tag}"
 }
}


resource aws_subnet "public1_subnet" {
  cidr_block="${var.private_subnet1_cidr}"
  availability_zone= "${var.availzone_1}"
  vpc_id="${aws_vpc.vpc.id}"
    tags=  {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_PUB1-${var.availzone_1}"
     Owner="${var.owner_tag}"
 }

}

resource aws_subnet "public2_subnet" {
  cidr_block= "${var.private_subnet2_cidr}"
  availability_zone= "${var.availzone_2}"
  vpc_id="${aws_vpc.vpc.id}"
    tags=  {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_PUB2-${var.availzone_2}"
     Owner="${var.owner_tag}"
 }

}

resource aws_subnet "public3_subnet" {
  cidr_block= "${var.private_subnet3_cidr}"
  availability_zone= "${var.availzone_3}"
  vpc_id="${aws_vpc.vpc.id}"
    tags=  {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_PUB3-${var.availzone_3}"
     Owner="${var.owner_tag}"
 }

}
