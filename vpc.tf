# # # # VPC AND NETWORK # # # # #

# VPC Resource
resource "aws_vpc" "myVPC" {
    cidr_block = "${var.VPC_CIDR}"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags { Name = "myVPC" }
}
# Subnet Resources Public
resource "aws_subnet" "myVPC-public-subnet-1" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "${var.VPC_Public_CIDR_1}"
    map_public_ip_on_launch = "true"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    tags { Name = "myVPC-public-subnet-1" }
}
resource "aws_subnet" "myVPC-public-subnet-2" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "${var.VPC_Public_CIDR_2}"
    map_public_ip_on_launch = "true"
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
    tags { Name = "myVPC-public-subnet-2" }
}
resource "aws_subnet" "myVPC-public-subnet-3" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "${var.VPC_Public_CIDR_3}"
    map_public_ip_on_launch = "true"
    availability_zone = "${data.aws_availability_zones.available.names[2]}"
    tags { Name = "myVPC-public-subnet-3" }
}
# Subnet Resources Private
resource "aws_subnet" "myVPC-private-subnet-1" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "${var.VPC_Private_CIDR_1}"
    map_public_ip_on_launch = "false"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
    tags { Name = "myVPC-private-subnet-1" }
}
resource "aws_subnet" "myVPC-private-subnet-2" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "${var.VPC_Private_CIDR_2}"
    map_public_ip_on_launch = "false"
    availability_zone = "${data.aws_availability_zones.available.names[1]}"
    tags { Name = "myVPC-private-subnet-2" }
}
resource "aws_subnet" "myVPC-private-subnet-3" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "${var.VPC_Private_CIDR_3}"
    map_public_ip_on_launch = "false"
    availability_zone = "${data.aws_availability_zones.available.names[2]}"
    tags { Name = "myVPC-private-subnet-3" }
}
# Internet Gateway
resource "aws_internet_gateway" "myVPC-gateway" {
    vpc_id = "${aws_vpc.myVPC.id}"
    tags { Name = "myVPC" }
}
# Route Tables
resource "aws_route_table" "myVPC-public-route" {
    vpc_id = "${aws_vpc.myVPC.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.myVPC-gateway.id}"
    }
    tags { Name = "myVPC-public-route" }
}
# Route Associations for Public
resource "aws_route_table_association" "myVPC-public-1" {
    subnet_id = "${aws_subnet.myVPC-public-subnet-1.id}"
    route_table_id = "${aws_route_table.myVPC-public-route.id}"
}
resource "aws_route_table_association" "myVPC-public-2" {
    subnet_id = "${aws_subnet.myVPC-public-subnet-2.id}"
    route_table_id = "${aws_route_table.myVPC-public-route.id}"
}
resource "aws_route_table_association" "mmyVPC-public-3" {
    subnet_id = "${aws_subnet.myVPC-public-subnet-3.id}"
    route_table_id = "${aws_route_table.myVPC-public-route.id}"
}
