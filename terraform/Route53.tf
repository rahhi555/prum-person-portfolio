resource "aws_route53_zone" "prum_person_portfolio_route53_zone" {
  name = "hirabayashi.work"
}

# http及びhttps用のドメイン紐付け
resource "aws_route53_record" "http_https" {
  zone_id = aws_route53_zone.prum_person_portfolio_route53_zone.zone_id
  name = "www"
  type = "A"

  alias {
    name = aws_lb.prum_person_portfolio.dns_name
    zone_id = aws_lb.prum_person_portfolio.zone_id
    evaluate_target_health = false
  }
}

output "route53_http" {
  value = aws_route53_record.http_https.name
}