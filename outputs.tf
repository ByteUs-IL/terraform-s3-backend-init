output "bucket" {
  description = "The name of the S3 bucket holding the state file"
  value       = one(module.s3_backend[*].name)
}

output "dynamodb_table" {
  description = "The name of DynamoDB table holding the state lock"
  value       = aws_dynamodb_table.backend.name
}

output "region" {
  description = "The region where the state file is located at"
  value       = var.aws_region
}

output "kms_key_id" {
  description = "The id of the Customer-Managed KMS key encrypting the s3 backend"
  value       = one(module.s3_backend[*].kms_key_id)
}
