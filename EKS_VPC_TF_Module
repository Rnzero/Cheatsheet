provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 3.0.0"
  name = "eks-vpc"
  cidr = var.vpc_cidr
  azs  = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  enable_nat_gateway = true
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = ">= 18.0.0"
  cluster_name    = var.cluster_name
  cluster_version = var.k8s_version
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    default = {
      desired_capacity = 2
      min_capacity     = 1
      max_capacity     = 3
      instance_types   = ["t3.medium"]
    }
  }

  manage_aws_auth = true
}
