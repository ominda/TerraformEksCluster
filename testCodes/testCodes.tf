variable "parent_cidr" {
  description = "The parent CIDR block to be partitioned"
  type        = string
  default = "10.1.0.0/16"
}

variable "num_subnets" {
  description = "The number of subnets to partition"
  type        = number
  default = 4
}

locals {
  subnet_bits = log2(var.num_subnets)
}

resource "aws_subnet" "subnets" {
  count = var.num_subnets

  cidr_block = cidrsubnets(var.parent_cidr, count.index)
  # Other subnet configuration...
}
