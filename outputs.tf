output "aws_s3_bucket_id" {
  description = "The name of the S3 bucket holding the state file"
  value       = one(module.s3_backend[*].s3_bucket_id)
}

output "aws_kms_key_arn" {
  description = "The arn of the Customer-Managed KMS key encrypting the s3 backend"
  value       = one(module.s3_backend[*].kms_key_arn)
}

output "aws_dynamodb_table_arn" {
  description = "The arn of DynamoDB table holding the state lock"
  value       = aws_dynamodb_table.backend.arn
}

output "iam_policy_arn" {
  description = "The id of the IAM policy that will grant the access to the backend components"
  value       = one(module.iam_policy[*].iam_policy_id)
}
