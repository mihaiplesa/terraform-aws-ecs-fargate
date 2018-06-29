variable "region" {
  description = "Region that infra will be created"
}

variable "domain" {
  description = "The domain of your application"
}

variable "primary_dns_zone_id" {
  description = "The primary Route53 DNS zone id"
}

/*====
environment specific variables
======*/

variable "production_database_multi_az" {
  description = "Multi AZ enabled for production database"
}

variable "production_database_name" {
  description = "The database name for production"
}

variable "production_database_username" {
  description = "The username for the production database"
}

variable "production_database_password" {
  description = "The user password for the production database"
}

variable "production_database_backup_retention_period" {
  description = "The number of days to keep database snapshots"
}

variable "production_web_instances_desired" {
  description = "The number of desired web instances"
}

variable "production_web_instances_min" {
  description = "The min number of web instances"
}

variable "production_web_instances_max" {
  description = "The max number of web instances"
}
