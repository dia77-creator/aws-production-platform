output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "VPC CIDR block."
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = module.vpc.private_subnet_ids
}

output "public_route_table_id" {
  description = "Public route table ID."
  value       = module.vpc.public_route_table_id
}

output "private_route_table_id" {
  description = "Private route table ID."
  value       = module.vpc.private_route_table_id
}

output "availability_zones" {
  description = "Availability Zones."
  value       = module.vpc.availability_zones
}

output "alb_security_group_id" {
  description = "ALB security group ID."
  value       = module.security_groups.alb_security_group_id
}

output "workload_security_group_id" {
  description = "Workload security group ID."
  value       = module.security_groups.workload_security_group_id
}

output "database_security_group_id" {
  description = "Database security group ID."
  value       = module.security_groups.database_security_group_id
}

output "eks_cluster_role_arn" {
  description = "EKS cluster IAM role ARN."
  value       = module.iam.eks_cluster_role_arn
}

output "ecr_repository_name" {
  description = "ECR repository name."
  value       = module.ecr.repository_name
}

output "ecr_repository_url" {
  description = "ECR repository URL."
  value       = module.ecr.repository_url
}

output "ecr_repository_arn" {
  description = "ECR repository ARN."
  value       = module.ecr.repository_arn
}

output "eks_cluster_name" {
  description = "EKS cluster name."
  value       = module.eks.cluster_name
}

output "eks_cluster_arn" {
  description = "EKS cluster ARN."
  value       = module.eks.cluster_arn
}

output "eks_cluster_endpoint" {
  description = "EKS Kubernetes API endpoint."
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "EKS cluster security group ID."
  value       = module.eks.cluster_security_group_id
}