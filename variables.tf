variable "v_Region" {
  type        = string
  description = "Default region for the deployment"
}

# Cost Tags or any common tags needs to be applied to all the resources
variable "v_CostTag01" {
  type = string
}

variable "v_CostTag02" {
  type = string
}

variable "v_CostTag03" {
  type = string
}

variable "v_CostTag04" {
  type = string
}

variable "v_ProjectName" {
  type        = string
  default     = "chg-app-dev"
  description = "Project Name"
}
variable "v_VpcCidrBlock01" {
  type        = string
  default     = "172.29.88.0/24"
  description = "Primary CIDR for the VPC"
}

variable "v_VpcCidrBlock02" {
  type        = string
  default     = "172.29.153.128/26"
  description = "Public subnet CIDR for the VPC"
}

variable "v_VpcCidrBlock03" {
  type        = string
  default     = "172.29.109.128/25"
  description = "ELB CIDR for the VPC"
}

variable "v_VpcCidrBlock04" {
  type        = string
  default     = "100.96.88.0/21"
  description = "Node Group CIDR for the VPC"
}

variable "v_VpcCidrBlock05" {
  type        = string
  default     = "172.30.134.0/25"
  description = "NAT CIDR for the VPC"
}

variable "v_PrivateSubnets" {
  type        = map(string)
  description = "Private subnets"
}


