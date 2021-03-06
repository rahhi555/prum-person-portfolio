# ecsをcloudwatchでログ収集するための設定
resource "aws_cloudwatch_log_group" "for_front" {
  name = "/ecs/front"
  retention_in_days = 180
}

# ecsをcloudwatchでログ収集するための設定
resource "aws_cloudwatch_log_group" "for_api" {
  name = "/ecs/api"
  retention_in_days = 180
}
