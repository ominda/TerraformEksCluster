terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

provider "aws" {
  region = var.v_Region

  default_tags {
    tags = {
      identifier           = "Terraform IaC"
      "map-migrated"       = var.v_CostTag01
      "dialog:projectname" = var.v_CostTag02
      "dialog:environment" = var.v_CostTag03
      "dialog:cxoname"     = var.v_CostTag04
    }
  }
}