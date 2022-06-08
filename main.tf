//resource "aws_ec2_transit_gateway" "tgw" {
//  description = "roboshop-tgw"
//  tags = {
//    Name = "roboshop-tgw-${var.ENV}"
//  }
//}
//
//resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-attach" {
//  subnet_ids         = data.aws_subnet_ids.default-vpc.ids
//  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
//  vpc_id             = var.DEFAULT_VPC_ID
//  tags = {
//    Name = "roboshop-tgw-attach-${var.ENV}"
//  }
//}
//


////////////////

resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "roboshop-tgw"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  tags = {
    Name = "roboshop-tgw-${var.ENV}"
  }
}

resource "aws_eip" "ngw" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = "subnet-03e3869fb4143cbc1"

  tags = {
    Name = "NGW"
  }
}

variable "subnets" {
  default = ["172.31.96.0/20", "172.31.112.0/20", "172.31.128.0/20", "172.31.144.0/20", "172.31.160.0/20", "172.31.176.0/20"]
}

variable "AZ" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

resource "aws_subnet" "private" {
  count             = length(var.subnets)
  vpc_id            = var.DEFAULT_VPC_ID
  cidr_block        = element(var.subnets, count.index)
  availability_zone = element(var.AZ, count.index)
  tags = {
    Name = "default-vpc-private-${count.index + 1}"
  }
}



//resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-attach" {
//  subnet_ids         = data.aws_subnet_ids.default-vpc.ids
//  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
//  vpc_id             = var.DEFAULT_VPC_ID
//  tags = {
//    Name = "roboshop-tgw-attach-${var.ENV}"
//  }
//}

