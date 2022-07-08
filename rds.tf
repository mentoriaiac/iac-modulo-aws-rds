resource "aws_db_instance" "rapadura" {
  allocated_storage      = var.storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_type
  name                   = var.db_name
  username               = var.db_username
  password               = aws_ssm_parameter.db_passwd.value
  port                   = var.port
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.sg_rds.id]
  identifier             = var.identifier
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.snapshot
  publicly_accessible    = true
  tags                   = var.default_tags
}
