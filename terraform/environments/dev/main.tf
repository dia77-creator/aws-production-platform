module "vpc" {
  source = "../../modules/vpc"

  name = "production-platform"

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  enable_nat_gateway = var.enable_nat_gateway

  single_nat_gateway = var.single_nat_gateway
}

module "security_groups" {
  source = "../../modules/security_groups"

  name        = "production-platform"
  environment = var.environment

  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "../../modules/iam"

  name        = "production-platform"
  environment = var.environment
}

module "ecr" {
  source = "../../modules/ecr"

  name        = "production-platform"
  environment = var.environment
}

module "eks" {
  source = "../../modules/eks"

  name               = "production-platform"
  environment        = var.environment
  kubernetes_version = var.kubernetes_version

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = module.vpc.private_subnet_ids

  cluster_role_arn = module.iam.eks_cluster_role_arn

  node_role_arn      = module.iam.eks_node_role_arn
  node_instance_type = var.node_instance_type
  node_desired_size  = var.node_desired_size
  node_min_size      = var.node_min_size
  node_max_size      = var.node_max_size
}