resource "aws_acm_certificate" "cert" {
  domain_name      = "${var.cert_domain}"
  validation_method = "DNS"

  tags = {
    App = "${var.app_tag}"
     Name= "${var.owner_tag}_CERT"
     Owner="${var.owner_tag}"
  }

  lifecycle {
    create_before_destroy = true
  }
}