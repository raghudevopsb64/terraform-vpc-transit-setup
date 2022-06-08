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



//resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-attach" {
//  subnet_ids         = data.aws_subnet_ids.default-vpc.ids
//  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
//  vpc_id             = var.DEFAULT_VPC_ID
//  tags = {
//    Name = "roboshop-tgw-attach-${var.ENV}"
//  }
//}

