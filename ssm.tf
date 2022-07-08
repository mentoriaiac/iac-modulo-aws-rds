resource "aws_ssm_parameter" "db_endpoint" {
  name        = "/${var.proj_name}/postgres_endpoint"
  description = "database endpoint"
  type        = "SecureString"
  value       = aws_db_instance.rapadura.address
}

resource "aws_ssm_parameter" "db_passwd" {
  name        = "/${var.proj_name}/postgres_password"
  description = "database password"
  type        = "SecureString"
  value       = random_password.postgres_password.result

}

resource "aws_ssm_parameter" "db_name" {
  name        = "/${var.proj_name}/postgres_name"
  description = "database name"
  type        = "SecureString"
  value       = aws_db_instance.rapadura.name
}

resource "aws_ssm_parameter" "db_user" {
  name        = "/${var.proj_name}/postgres_user"
  description = "database user"
  type        = "SecureString"
  value       = aws_db_instance.rapadura.username
}


resource "aws_ssm_parameter" "main" {
  for_each    = {
    for p in var.parameters:p.name=>p
    
  }
  name        = "/${var.proj_name}/${each.key}"
  description = each.value.description
  type        = each.value.type
  value       = each.value.value
}

resource "random_password" "postgres_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
