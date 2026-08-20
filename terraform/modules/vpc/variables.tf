variable "name" {
  description = "Name prefix for VPC resources."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones for the VPC."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether NAT Gateway should be created."
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway."
  type        = bool
  default     = true
}