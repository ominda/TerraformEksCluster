variable "v_VpcCidrBlock" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Default VPC CIDR block"
}

variable "v_VpcName" {
  type = string
  # default = "CO-Build"
  description = "VPC Name"
}

variable "v_CreatorName" {
  type = string
  # default = "Terraform"
  description = "Who has created the resources"
}

variable "v_PublicSubnetCidr" {
  type        = string
  description = "CIDR rainge for public subnets"
}

variable "v_NodeGroupSubnetCidr" {
  type        = string
  description = "CIDR range for NodeGroups and PODs"
}