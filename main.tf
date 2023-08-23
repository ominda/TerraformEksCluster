module "vpc" {
  source        = "./vpc"
  vpcName       = var.v_VpcName
  cidrBlock     = var.v_VpcCidrBlock
  creator       = var.v_CreatorName
  publicSubnets = var.v_PublicSubnetCidr
  nodeGroup     = var.v_NodeGroupSubnetCidr
}