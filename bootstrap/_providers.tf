provider "aws" {
  profile = "padok-dojo-sso"
  region  = "eu-west-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }
}
