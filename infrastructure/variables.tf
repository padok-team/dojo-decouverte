variable "aws_region" {
  type        = string
  description = "Region were the assets will be deployed"
  default     = "eu-west-2"
}

variable "aws_profile" {
  type        = string
  description = "Name of the AWS profile"
  default     = "padok-dojo-decouverte"
}

variable "ssh_key" {
  type = string
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "public_subnet" {
  type        = string
  description = "ID of the public subnet"
}
