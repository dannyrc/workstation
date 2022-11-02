terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.63"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Terraform = true
    }
  }
}