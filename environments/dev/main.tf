module "vpc" {
  source = "../../modules/vpc"

  vpc_name     = "dev-main-vpc"
  environment  = "dev"
  cluster_name = "dev-eks-cluster"

  vpc_cidr = "10.0.0.0/16"
  availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]

  private_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]

  public_subnet_cidrs = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]

  tags = {
    Project     = "video-analysis"
    Environment = "dev"
    Terraform   = "true"
  }
}