module "vpc" {
  source = "../../modules/vpc"

  vpc_name            = var.vpc_name
  environment         = var.environment
  cluster_name        = var.cluster_name
  vpc_cidr           = var.vpc_cidr
  availability_zones  = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  tags                = var.tags
}