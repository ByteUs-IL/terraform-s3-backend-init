output "s3_bucket_id" {
  description = "The name of the S3 bucket holding the state file"
  value       = aws_s3_bucket.backend.id
}

output "kms_key_arn" {
  description = "The arn of the Customer-Managed KMS key encrypting the s3 backend"
  value       = aws_kms_key.s3_decrypt_key.arn
}

output "kms_key_id" {
  description = "The id of the Customer-Managed KMS key encrypting the s3 backend"
  value       = aws_kms_key.s3_decrypt_key.id
}