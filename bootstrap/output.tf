output vpc_id {
  value = module.vpc.vpc_id
}

output "public_subnet" {
  value = module.vpc.public_subnets
}
