resource "aws_s3_bucket" "cloudtrail" {
  bucket = "my-company-cloudtrail-logs-12345"
  acl    = "private"

  versioning { enabled = true }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
        kms_master_key_id = aws_kms_key.cloudtrail.arn
      }
    }
  }
}

resource "aws_kms_key" "cloudtrail" {
  description = "KMS key for CloudTrail bucket"
}
