locals {
  my_origin_id = "my-origin"
}

resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    domain_name = aws_lb.test.dns_name
    origin_id   = local.my_origin_id
    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }
  enabled         = true
  is_ipv6_enabled = true
  comment         = "my-cloudfront-distribution"
  aliases         = ["cloudcrowd.org"]
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.my_origin_id
    forwarded_values {
      query_string = false
      headers      = ["host", "origin", "Access-Control-Request-Headers", "Access-Control-Request-Method"]
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  price_class = "PriceClass_All"
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = false
    ssl_support_method             = "sni-only"
    acm_certificate_arn            = "arn:aws:acm:us-east-1:710242627084:certificate/6320b13a-6095-469e-aae3-9880052fdf3d"
    minimum_protocol_version       = "TLSv1.2_2018"
  }
}