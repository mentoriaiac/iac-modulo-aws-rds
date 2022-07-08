variable "aws_region" {
  default     = "us-east-1"
  description = "Region of Amazon AWS"
}

variable "storage" {
  type        = number
  default     = 20
  description = "The allocated storage"
}

variable "storage_type" {
  type        = string
  default     = "gp2"
  description = "The type of the storage"
}

variable "engine" {
  type        = string
  default     = "postgres"
  description = "The database engine"
}

variable "engine_version" {
  default     = "12.7"
  type        = number
  description = "The engine version for database"
}

variable "instance_type" {
  default     = "db.t2.micro"
  type        = string
  description = "The RDS instance class"
}

variable "db_username" {
  default     = "mariaquiteriaadmin"
  type        = string
  description = "Username of the database"
}

variable "db_name" {
  default = "mariaquiteria"
  type = string
}

variable "port" {
  default     = "5432"
  type        = number
  description = "The database port"
}

variable "identifier" {
  default     = "database-mariaquiteria"
  type        = string
  description = "The name of the RDS instance"
}

variable "parameter_group_name" {
  default     = "default.postgres12"
  type        = string
  description = "Name of the DB parameter group to associate"
}

variable "snapshot" {
  default     = "true"
  type        = string
  description = "skip snapshot"
}

variable "default_tags" {
  type = map(any)
  default = {
    Name : "RDS_mariaquiteria",
    Team : "Mentoria-IAC",
    Application : "maria-quiteria",
    Environment : "Production",
    Terraform : "Yes",
    Owner : "Mentoria-IAC"
  }
}

variable "parameters" {
  type = list(
    object({
      type        = string,
      name        = string,
      description = string,
      value       = string,
    })
  )
  default = []
}

variable "subnet_ids"{
  type = list(string)
}

variable "proj_name" {
  type = string
  default = "mariaquiteria"
}

variable "vpc_id" {
  type = string
}
  