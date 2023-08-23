# Create VPC
resource "aws_vpc" "r_vpc" {
  cidr_block = var.cidrBlock
  tags = {
    Name    = var.vpcName
    Creator = var.creator
  }
}

# Attach secondary CIDR to the VPC, Use this for public subnets
resource "aws_vpc_ipv4_cidr_block_association" "r_publicSubnetCidr" {
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = var.publicSubnets
}

# Attach 3rd CIDR to the VPC, This can use for NodeGroups and PODs
resource "aws_vpc_ipv4_cidr_block_association" "r_nodeGroupAndPods" {
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = var.nodeGroup
}