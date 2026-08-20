resource "aws_security_group" "alb" {
  name        = "${var.name}-${var.environment}-alb-sg"
  description = "Security group for the Application Load Balancer."
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-${var.environment}-alb-sg"
  }
}

resource "aws_security_group" "workload" {
  name        = "${var.name}-${var.environment}-workload-sg"
  description = "Security group for application workloads."
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-${var.environment}-workload-sg"
  }
}

resource "aws_security_group" "database" {
  name        = "${var.name}-${var.environment}-database-sg"
  description = "Security group for database workloads."
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name}-${var.environment}-database-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
    security_group_id = aws_security_group.alb.id
    description = "Allow HTTP traffic from the internet."
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  security_group_id = aws_security_group.alb.id

  description = "Allow HTTPS traffic from the internet."

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "workload_app" {
    security_group_id = aws_security_group.workload.id
    description = "Allow application traffic from the ALB."
    referenced_security_group_id = aws_security_group.alb.id

    from_port   = 8000
    to_port     = 8000
    ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "database_postgres" {
    security_group_id = aws_security_group.database.id
    description = "Allow PostgreSQL traffic from application workloads."

    referenced_security_group_id = aws_security_group.workload.id
    from_port   = 5432
    to_port     = 5432
    ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "workload_all" {
  security_group_id = aws_security_group.workload.id

  description = "Allow outbound traffic from application workloads."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "database_all" {
  security_group_id = aws_security_group.database.id

  description = "Allow outbound traffic from the database."

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}