resource "aws_route53_zone" "main" {
  name = "cloudcrowd.org"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "cloudcrowd.org"
  type    = "A"
alias {
    name                   = aws_cloudfront_distribution.my_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.my_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

