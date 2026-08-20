aws_region  = "ap-southeast-1"
environment = "dev"
vpc_cidr    = "10.0.0.0/16"

availability_zones = [
  "ap-southeast-1a",
  "ap-southeast-1b",
  "ap-southeast-1c"
]

enable_nat_gateway = false
single_nat_gateway = true