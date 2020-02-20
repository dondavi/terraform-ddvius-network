resource aws_security_group "private_sg" {
description="INTERNAL ONLY"
 
 
 tags = {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_INT_SG"
     Owner="${var.owner_tag}"
 }
}

resource aws_security_group_rule "private_sg_r1" {
    type="ingress"
    security_group_id="${aws_security_group.private_sg.id}"
    from_port=3306
    to_port=3306
    protocol="tcp"
    source_security_group_id = "${aws_security_group.public_sg.id}"
}

resource "aws_security_group_rule" "private_sg_r2" {
  security_group_id="${aws_security_group.private_sg.id}"
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  source_security_group_id = "${aws_security_group.public_sg.id}"
}

resource "aws_security_group_rule" "private_sg_r3" {
  security_group_id="${aws_security_group.private_sg.id}"
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  source_security_group_id = "${aws_security_group.public_sg.id}"
}

resource "aws_security_group_rule" "private_sg_r4" {
  security_group_id="${aws_security_group.private_sg.id}"
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "all"
  cidr_blocks = ["0.0.0.0/0"]
}



resource aws_security_group "public_sg" {
description="EXTERNAL ONLY"
 tags = {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_EXT_SG"
     Owner="${var.owner_tag}"
 }
}

resource aws_security_group_rule "public_sg_r1" {
    type="ingress"
    security_group_id="${aws_security_group.public_sg.id}"
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

resource aws_security_group_rule "public_sg_r2" {
    type="ingress"
    security_group_id="${aws_security_group.public_sg.id}"
    from_port=443
    to_port=443
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
}


resource aws_security_group_rule "public_sg_r3" {
    type="ingress"
    security_group_id="${aws_security_group.public_sg.id}"
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "public_sg_r4" {
  security_group_id="${aws_security_group.public_sg.id}"
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "all"
  cidr_blocks = ["0.0.0.0/0"]
}

