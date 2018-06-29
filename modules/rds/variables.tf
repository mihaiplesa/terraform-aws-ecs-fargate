variable "environment" {
  description = "The environment"
}

variable "subnet_ids" {
  type        = "list"
  description = "Subnet ids"
}

variable "vpc_id" {
  description = "The VPC id"
}

//variable "allowed_security_group_id" {
//  description = "The allowed security group id to connect on RDS"
//}

variable "allocated_storage" {
  description = "The storage size in GB"
  default     = "20"
}

variable "instance_class" {
  description = "The instance type"
}

variable "multi_az" {
  description = "RDS muti-az allowed"
  default     = false
}

variable "database_name" {
  description = "The database name"
}

variable "database_username" {
  description = "The username of the database"
}

variable "database_password" {
  description = "The password of the database"
}

variable "database_backup_retention_period" {
  description = "The number of days to keep database snapshots"
}
