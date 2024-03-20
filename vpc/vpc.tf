# Create VPC
resource "aws_vpc" "r_vpc" {
  cidr_block = var.cidrBlock01
  tags = {
    Name = "${var.projectName}-vpc"
  }
}

# Attach secondary CIDR to the VPC, Use this for public subnets
resource "aws_vpc_ipv4_cidr_block_association" "r_publicSubnetCidr" {
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = var.cidrBlock02
}

# Attach CIDR to the VPC, This can use for ELBs
resource "aws_vpc_ipv4_cidr_block_association" "r_elbSubnetCidr" {
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = var.cidrBlock03
}

# Attach CIDR to the VPC, This can use for Node Group and Pods
resource "aws_vpc_ipv4_cidr_block_association" "r_nodeGroupSubnetCidr" {
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = var.cidrBlock04
}

# Attach CIDR to the VPC, This can use for Node Group and Pods
resource "aws_vpc_ipv4_cidr_block_association" "r_NatSubnetCidr" {
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = var.cidrBlock05
}

resource "aws_subnet" "r_PublicSubnets" {
  count = 2 # Adjust this value for the desired number of public subnets

  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = cidrsubnets(var.cidrBlock02, 1, 1)[count.index]

  # availability_zone = format("us-east-%d", count.index + 1)  # Distribute across zones
  tags = {
    Name = format("${var.projectName}-PublicSubnet-0%d", count.index + 1)
  }
}

resource "aws_subnet" "r_PrivateSubnets" {
  for_each   = var.privateSubnets
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = each.value
  tags = {
    Name = format("${var.projectName}-%s", each.key)
  }
}

# LB Secondary subnets
resource "aws_subnet" "r_LbSecondarySubnets" {
  count      = 2
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = cidrsubnets(var.cidrBlock03, 1, 1)[count.index]

  tags = {
    Name = format("${var.projectName}-elb-subnet-0%d", count.index + 3)
  }
}

# EFS subnets
resource "aws_subnet" "r_EfsSubnets" {
  count      = 2
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = cidrsubnets(aws_vpc.r_vpc.cidr_block, 2, 2)[count.index]

  tags = {
    Name = format("${var.projectName}-efs-subnet-0%d", count.index + 1)
  }
}

resource "aws_subnet" "r_NatSubnets" {
  vpc_id = aws_vpc.r_vpc.id
  cidr_block = var.cidrBlock05
  tags = {
    Name = "${var.projectName}-private-nat-subnet-01"
  }  
}

resource "aws_subnet" "r_NodeGroupSubnets" {
  count      = 2
  vpc_id     = aws_vpc.r_vpc.id
  cidr_block = cidrsubnets(var.cidrBlock04, 2, 2)[count.index]

  tags = {
    Name = format("${var.projectName}-nodegroup-subnet-0%d", count.index + 1)
  }
}