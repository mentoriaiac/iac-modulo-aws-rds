provider "aws" {
  region = "us-east-1"
}

module "rds_mariaquiteria" {
  source               = "../"
  subnet_ids           = ["subnet-00825b5be94f27bfe", "subnet-066dc161feeef4a79"]
  proj_name            = "mariaquiteria"
  vpc_id               = "vpc-07f5d91b4aa236675"
  port                 = 5432
  storage              = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.7"
  instance_type        = "db.t2.micro"
  db_name              = "mariaquiteria"
  db_username          = "mariaquiteriaadmin"
  identifier           = "database-mariaquiteria"
  parameter_group_name = "default.postgres12"
  snapshot             = true
  parameters = [{
    name        = "sentry_dsn",
    description = "sentry dsn",
    type        = "String",
    value       = " "
    },
    {
      name        = "spidermon_telegram_fake",
      description = "spidermon_telegram_fake"
      type        = "String"
      value       = " "
    },
    {
      name        = "spidermon_sentry_fake",
      description = "spidermon_sentry_fake"
      type        = "String"
      value       = " "
    },
    {
      name        = "django_settings_module",
      description = "django_settings_module"
      type        = "String"
      value       = " "

    },
    {
      name        = "django_configuration",
      description = "django_configuration"
      type        = "String"
      value       = " "
    },
    {
      name        = "django_secret_key",
      description = "django_secret_key"
      type        = "String"
      value       = " "
    },
    {
      name        = "access_token_lifetime_in_minutes",
      description = "access_token_lifetime_in_minutes"
      type        = "String"
      value       = " "
    },
    {
      name        = "refresh_token_lifetime_in_minutes",
      description = "refresh_token_lifetime_in_minutes"
      type        = "String"
      value       = " "

    },
    {
      name        = "aws_s3_bucket",
      description = "aws_s3_bucket"
      type        = "String"
      value       = " "
    },
    {
      name        = "aws_s3_bucket_folder",
      description = "aws_s3_bucket_folder"
      type        = "String"
      value       = " "
    },
    {
      name        = "aws_s3_region",
      description = "aws_s3_region"
      type        = "String"
      value       = " "
  }]

}

