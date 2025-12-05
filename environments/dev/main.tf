provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "vpc" {
  source       = "../../modules/vpc"
  vpc_cidr     = var.vpc_cidr
  public_subnets = var.public_subnets
  name_prefix  = var.name_prefix
  tags = {
    Environment = var.environment
  }
}

module "ec2_web" {
  source        = "../../modules/ec2"
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.public_subnet_ids
  instance_count = var.web_instance_count
  instance_type = var.web_instance_type
  key_name      = var.key_name
  instance_name = "${var.environment}-web"
  my_ip_cidr    = var.my_ip_cidr
  http_allow_cidrs = var.http_allow_cidrs
  tags = {
    Environment = var.environment
  }
}

