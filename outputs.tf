output "TRANSIT_GW" {
  value = aws_ec2_transit_gateway.tgw.id
}

output "DEFAULT_VPC_ID" {
  value = var.DEFAULT_VPC_ID
}

output "DEFAULT_VPC_RT" {
  value = var.DEFAULT_VPC_RT
}

output "DEFAULT_VPC_CIDR" {
  value = data.aws_vpc.default.cidr_block
}

output "DEFAULT_VPC_TRANSIT_GW_ATTACHMENT" {
  value = aws_ec2_transit_gateway_vpc_attachment.tgw-attach.id
}

output "DEFAULT_VPC_TRANSIT_GW_ROUTE_TABLE" {
  value = aws_ec2_transit_gateway_route_table.default-vpc.id
}

output "APP_VPC_TRANSIT_GW_ROUTE_TABLE" {
  value = aws_ec2_transit_gateway_route_table.all-app-vpc.id
}

output "NGW_PRIVATE_IP" {
  value = aws_nat_gateway.nat-gw.private_ip
}

