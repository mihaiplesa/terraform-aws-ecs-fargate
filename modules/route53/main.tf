resource "aws_route53_record" "prod" {
  zone_id = "${var.primary_dns_zone_id}"

  name = "${var.domain}"
  type = "A"

  alias {
    name                   = "${var.alb_dns_name}"
    zone_id                = "${var.alb_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_prod" {
  zone_id = "${var.primary_dns_zone_id}"

  name = "www.${var.domain}"
  type = "A"

  alias {
    name                   = "${var.alb_dns_name}"
    zone_id                = "${var.alb_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate" "cert" {
  domain_name               = "${var.domain}"
  subject_alternative_names = ["${var.certificate_subject_names}"]
  validation_method         = "DNS"
}

resource "aws_route53_record" "cert_validation_cname" {
  count   = "${length(var.certificate_subject_names) + 1}"
  name    = "${lookup(aws_acm_certificate.cert.domain_validation_options[count.index], "resource_record_name")}"
  type    = "${lookup(aws_acm_certificate.cert.domain_validation_options[count.index], "resource_record_type")}"
  records = ["${lookup(aws_acm_certificate.cert.domain_validation_options[count.index], "resource_record_value")}"]

  zone_id = "${var.primary_dns_zone_id}"
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = "${aws_acm_certificate.cert.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation_cname.*.fqdn}"]

  lifecycle {
    create_before_destroy = true
  }
}
