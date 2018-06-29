variable "domain" {
  description = "The domain of your application"
}

variable "certificate_subject_names" {
  description = "The extra subject names for the domain certificate"
  default     = []
}

variable "primary_dns_zone_id" {
  description = "The Route 53 zone id of the ALB"
}

variable "alb_dns_name" {
  description = "The DNS name for the ALB"
}

variable "alb_zone_id" {
  description = "The Route 53 zone id of the ALB"
}
