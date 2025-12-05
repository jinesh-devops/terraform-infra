output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "web_instance_ids" {
  value = module.ec2_web.instance_ids
}

output "web_instance_public_ips" {
  value = module.ec2_web.public_ips
}

