resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-${var.proj_name}-subnet"
  subnet_ids = var.subnet_ids

  tags = var.default_tags
}

resource "aws_security_group" "sg_rds" {
  name   = "SG_rds-${var.proj_name}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.default_tags
}
