output "rds_hostname" {
  value       = aws_db_instance.rapadura.address
  description = "Hostname da instância RDS"
}

output "rds_port" {
  value       = aws_db_instance.rapadura.port
  description = "Porta da instância RDS"
}

output "rds_username" {
  value       = aws_db_instance.rapadura.username
  description = "Nome de usuário root da Instância RDS"
}

output "db_endpoint" {
  value       = aws_ssm_parameter.db_endpoint.arn
  description = "Endpoint de conexão da instância RDS"
}
