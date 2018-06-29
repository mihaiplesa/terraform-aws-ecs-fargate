module "route53" {
  source                    = "./modules/route53"
  domain                    = "${var.domain}"
  certificate_subject_names = ["*.${var.domain}"]
  primary_dns_zone_id       = "${var.primary_dns_zone_id}"
  alb_dns_name              = "${module.ecs.alb_dns_name}"
  alb_zone_id               = "${module.ecs.alb_zone_id}"
}
