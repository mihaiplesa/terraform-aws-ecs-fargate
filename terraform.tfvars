/* route53 */
region                        = "eu-west-1"
domain                        = "<TBC>"
primary_dns_zone_id           = "<TBC>"

/* ecs */
production_web_instances_desired = 2
production_web_instances_min = 2
production_web_instances_max = 8

/* rds */
production_database_multi_az = false
production_database_name     = "app_production"
production_database_username = "app"
production_database_password = "<TBC>"
production_database_backup_retention_period = 7
