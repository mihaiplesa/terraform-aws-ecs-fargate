variable "environment" {
  description = "The environment"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "availability_zones" {
  type        = "list"
  description = "The azs to use"
}

variable "security_groups_ids" {
  type        = "list"
  description = "The SGs to use"
}

variable "subnets_ids" {
  type        = "list"
  description = "The private subnets to use"
}

variable "public_subnet_ids" {
  type        = "list"
  description = "The private subnets to use"
}

variable "database_endpoint" {
  description = "The database endpoint"
}

variable "database_username" {
  description = "The database username"
}

variable "database_password" {
  description = "The database password"
}

variable "database_name" {
  description = "The database that the app will use"
}

variable "web_instances_desired" {
  description = "The number of desired web instances"
}

variable "web_instances_min" {
  description = "The min number of web instances"
}

variable "web_instances_max" {
  description = "The max number of web instances"
}

variable "repository_name" {
  description = "The name of the repisitory"
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate"
}
