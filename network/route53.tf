resource aws_route53_zone "public_hz" {
   name         = "${var.domain}"
   comment = "Registered in this AWS account"
   tags= {
     App = "${var.app_tag}"
     Name= "${var.owner_tag}_PUBLIC_HZ"
     Owner="${var.owner_tag}"
   }
}

resource "aws_route53_record" "TXT" {
  zone_id = "${aws_route53_zone.public_hz.zone_id}"
  name    = "${var.domain}"
  type    = "TXT"
  ttl     = "60"
  records = ["v=spf1 include:_spf.google.com ~all"]
}

resource "aws_route53_record" "MX" {
  zone_id = "${aws_route53_zone.public_hz.zone_id}"
  name    = "${var.domain}"
  type    = "MX"
  ttl     = "60"
  records = ["1 ASPMX.L.GOOGLE.COM.",
              "5 ALT1.ASPMX.L.GOOGLE.COM.",
              "5 ALT2.ASPMX.L.GOOGLE.COM.",
              "10 ASPMX2.GOOGLEMAIL.COM.",
              "10 ASPMX3.GOOGLEMAIL.COM."]
}

resource "aws_route53_record" "CNAME1" {
  zone_id = "${aws_route53_zone.public_hz.zone_id}"
  name    = "_1eff3c3c52256db98b9229b521f264e6.${var.domain}"
  type    = "CNAME"
  ttl     = "60"
  records = ["_87688ef7b2f47299eacd3af6d15b2278.mzlfeqexyx.acm-validations.aws"]
}

resource "aws_route53_record" "CNAME2" {
  zone_id = "${aws_route53_zone.public_hz.zone_id}"
  name    = "_domainconnect.${var.domain}"
  type    = "CNAME"
  ttl     = "60"
  records = ["_domainconnect.gd.domaincontrol.com"]
}

resource "aws_route53_record" "CNAME3" {
  zone_id = "${aws_route53_zone.public_hz.zone_id}"
  name    = "h.${var.domain}"
  type    = "CNAME"
  ttl     = "60"
  records = ["ddvi.webhop.net."]
}

resource "aws_route53_record" "CNAME4" {
  zone_id = "${aws_route53_zone.public_hz.zone_id}"
  name    = "twoxdmkq4pd.${var.domain}"
  type    = "CNAME"
  ttl     = "60"
  records = ["gv-edly6v2v7gwnwr.dv.googlehosted.com."]
}



//resource "aws_route53_record" "root" {
//  zone_id = "${aws_route53_zone.public_hz.zone_id}"
//  name    = "ddvi.us"
//  type    = "A"
//  alias {
//    name                   = "${aws_elb.main.dns_name}"
//    zone_id                = "${aws_elb.main.zone_id}"
//    evaluate_target_health = true
//  }
//}