resource "aws_cloudtrail" "main" {
  name                          = "org-trail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail.id
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  include_global_service_events = true   # capture global services (IAM, STS)
  # optional: cloud_watch_logs_group_arn and role_arn for CloudWatch integration
}
