output "aws_kms_key_id" {
  description = "The id of the Customer-Managed KMS key encrypting the s3 backend"
  value       = one(module.s3_backend[*].aws_kms_key_id)
}

output "aws_s3_bucket_id" {
  description = "The id of the S3 bucket holding the state file"
  value       = one(module.s3_backend[*].aws_s3_bucket_id)
}

output "aws_dynamodb_table_arn" {
  description = "The arn of DynamoDB table holding the state lock"
  value       = aws_dynamodb_table.backend.arn
}
