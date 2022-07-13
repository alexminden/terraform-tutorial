terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-northeast-1"
}

module "iam" {
    source = "./iam"
}

module "ec2" {
    source = "./ec2"

    iam_profile = module.iam.iam_profile
}