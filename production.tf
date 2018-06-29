locals {
  production_availability_zones = ["eu-west-1a", "eu-west-1b"]
}

provider "aws" {
  region = "${var.region}"

  #profile = "default"
}

module "vpc" {
  source               = "./modules/vpc"
  environment          = "production"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24", "10.0.20.0/24"]
  region               = "${var.region}"
  availability_zones   = "${local.production_availability_zones}"
}

module "rds" {
  source                           = "./modules/rds"
  environment                      = "production"
  allocated_storage                = "20"
  multi_az                         = "${var.production_database_multi_az}"
  database_name                    = "${var.production_database_name}"
  database_username                = "${var.production_database_username}"
  database_password                = "${var.production_database_password}"
  database_backup_retention_period = "${var.production_database_backup_retention_period}"
  subnet_ids                       = ["${module.vpc.private_subnets_id}"]
  vpc_id                           = "${module.vpc.vpc_id}"
  instance_class                   = "db.t2.micro"
}

module "ecs" {
  source             = "./modules/ecs"
  environment        = "production"
  vpc_id             = "${module.vpc.vpc_id}"
  availability_zones = "${local.production_availability_zones}"
  repository_name    = "app/production"
  subnets_ids        = ["${module.vpc.private_subnets_id}"]
  public_subnet_ids  = ["${module.vpc.public_subnets_id}"]

  web_instances_desired = "${var.production_web_instances_desired}"
  web_instances_min     = "${var.production_web_instances_min}"
  web_instances_max     = "${var.production_web_instances_max}"

  security_groups_ids = [
    "${module.vpc.security_groups_ids}",
    "${module.rds.db_access_sg_id}",
  ]

  database_endpoint = "${module.rds.rds_address}"
  database_name     = "${var.production_database_name}"
  database_username = "${var.production_database_username}"
  database_password = "${var.production_database_password}"
  certificate_arn   = "${module.route53.certificate_arn}"
}
