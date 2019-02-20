resource "aws_default_vpc" "default" {
  tags {
    Name = "MAIN VPC"
  }
}

##############################
#SUBNETS
########################

resource "aws_subnet" "root-subnet1" {
  vpc_id            = "${aws_default_vpc.default.id}"
  cidr_block        = "${var.cidr-block-web-subnet}"
  availability_zone = "us-east-1a"

  tags {
    Name = "root-vpc-subnet1"
  }
}

resource "aws_subnet" "root-subnet2" {
  vpc_id     = "${aws_default_vpc.default.id}"
  cidr_block = "172.31.1.0/24"

  availability_zone = "us-east-1b"

  tags {
    Name = "root-vpc-subnet2"
  }
}

############################
# Internet Gateway
####################

#resource "aws_internet_gateway" "Root-IG" {
#  vpc_id = "${aws_default_vpc.default.id}"
#
#  tags {
#    Name = "${var.IG-name}"
#  }
#}

#########################################
# Routing table
################

resource "aws_route_table" "root-public-rt" {
  vpc_id = "${aws_default_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"

    #gateway_id = "${aws_internet_gateway.Root-IG.id}"
    gateway_id = "igw-29a90251"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "root-public-rt1" {
  subnet_id      = "${aws_subnet.root-subnet1.id}"
  route_table_id = "${aws_route_table.root-public-rt.id}"
}

resource "aws_route_table_association" "root-public-rt2" {
  subnet_id      = "${aws_subnet.root-subnet2.id}"
  route_table_id = "${aws_route_table.root-public-rt.id}"
}
