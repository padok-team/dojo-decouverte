data "aws_availability_zones" "available" {}

/* 
VPC is Virtual Private Cloud.
This module will create a VPC with private and public subnets
*/
module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "3.7.0"

  // Name of the VPC
  name            = "dojo-decouverte-vpc"

  // CIDR
  cidr            = "172.16.0.0/16"

  // Avaibility zone for geographic location
  azs             = data.aws_availability_zones.available.names

  // CIDR of the public subnet
  public_subnets  = ["172.16.10.0/24"]
  private_subnets  = []

  // NAT gateway to enable egress traffic 
  enable_nat_gateway           = true
}
