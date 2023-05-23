terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.9"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Owner = "Prashanth G"
    }
  }
}