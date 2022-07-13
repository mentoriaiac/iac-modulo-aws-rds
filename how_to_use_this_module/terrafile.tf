provider "aws" {
  region = "us-east-1"
}

module "rds_mariaquiteria" {
  source                  = "../"
  subnet_ids              = ["subnet-00825b5be94f27bfe", "subnet-066dc161feeef4a79"]
  proj_name               = "mariaquiteria"
  vpc_id                  = "vpc-07f5d91b4aa236675"
  port                    = 5432
  storage                 = 20
  storage_type            = "gp2"
  engine                  = "postgres"
  engine_version          = "12.7"
  instance_type           = "db.t2.micro"
  db_name                 = "mariaquiteria"
  db_username             = "mariaquiteriaadmin"
  identifier              = "database-mariaquiteria"
  parameter_group_name    = "default.postgres12"
  snapshot                = true
  publicly_accessible_rds = true
  default_tags = {
    Name : "RDS_mariaquiteria",
    Team : "Mentoria-IAC",
    Application : "maria-quiteria",
    Environment : "Production",
    Terraform : "Yes",
    Owner : "Mentoria-IAC"
  }
  parameters = [{
    name        = "sentry_dsn",
    description = "Parâmetro referente à variável de ambiente SENTRY_DSN",
    type        = "String",
    value       = " "
    },
    {
      name        = "spidermon_telegram_fake",
      description = "Parâmetro referente à variável de ambiente SPIDERMON_TELEGRAM_FAKE"
      type        = "String"
      value       = " "
    },
    {
      name        = "spidermon_sentry_fake",
      description = "Parâmetro referente à variável de ambiente SPIDERMON_SENTRY_FAKE"
      type        = "String"
      value       = " "
    },
    {
      name        = "django_settings_module",
      description = "Parâmetro referente à variável de ambiente DJANGO_SETTINGS_MODULE"
      type        = "String"
      value       = " "

    },
    {
      name        = "django_configuration",
      description = "Parâmetro referente à variável de ambiente DJANGO_CONFIGURATION"
      type        = "String"
      value       = " "
    },
    {
      name        = "django_secret_key",
      description = "Parâmetro referente à variável de ambiente DJANGO_SECRET_KEY"
      type        = "String"
      value       = " "
    },
    {
      name        = "access_token_lifetime_in_minutes",
      description = "Parâmetro referente à variável de ambiente ACCESS_TOKEN_LIFETIME_IN_MINUTES"
      type        = "String"
      value       = " "
    },
    {
      name        = "refresh_token_lifetime_in_minutes",
      description = "Parâmetro referente à variável de ambiente REFRESH_TOKEN_LIFETIME_IN_MINUTES"
      type        = "String"
      value       = " "

    },
    {
      name        = "aws_s3_bucket",
      description = "Parâmetro referente à variável de ambiente AWS_S3_BUCKET"
      type        = "String"
      value       = " "
    },
    {
      name        = "aws_s3_bucket_folder",
      description = "Parâmetro referente à variável de ambiente AWS_S3_BUCKET_FOLDER"
      type        = "String"
      value       = " "
    },
    {
      name        = "aws_s3_region",
      description = "Parâmetro referente à variável de ambiente AWS_S3_REGION"
      type        = "String"
      value       = " "
  }]

}
