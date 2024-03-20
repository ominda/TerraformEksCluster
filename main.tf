module "vpc" {
  source         = "./vpc"
  projectName    = var.v_ProjectName
  cidrBlock01    = var.v_VpcCidrBlock01
  cidrBlock02    = var.v_VpcCidrBlock02
  cidrBlock03    = var.v_VpcCidrBlock03
  cidrBlock04    = var.v_VpcCidrBlock04
  cidrBlock05    = var.v_VpcCidrBlock05
  privateSubnets = var.v_PrivateSubnets
}