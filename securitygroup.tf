resource "aws_security_group" "Web-SG" {
  vpc_id = "${aws_vpc.myVPC.id}"
  name = "Web-SG"
  description = "Web Server Security Group"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      security_groups = ["${aws_security_group.Bastion-SG.id}"]
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = ["${aws_security_group.LB-SG.id}"]
  }
  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      security_groups = ["${aws_security_group.RDS-SG.id}"]
  }
  tags {
    Name = "Web-SG"
  }
}
resource "aws_security_group" "RDS-SG" {
  vpc_id = "${aws_vpc.myVPC.id}"
  name = "RDS-SG"
  description = "RDS Server Security Group"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["${var.VPC_CIDR}"]
  }
  tags {
    Name = "RDS-SG"
  }
}
resource "aws_security_group" "LB-SG" {
  vpc_id = "${aws_vpc.myVPC.id}"
  name = "LB-SG"
  description = "Load Balancer Segurity Group"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "LB-SG"
  }
}
resource "aws_security_group" "Bastion-SG" {
  vpc_id = "${aws_vpc.myVPC.id}"
  name = "Bastion-SG"
  description = "Bastion Segurity Group"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "Bastion-SG"
  }
}
