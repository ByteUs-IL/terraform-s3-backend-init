output "aws_s3_bucket_id" {
  description = "The id of the S3 bucket holding the state file"
  value       = aws_s3_bucket.backend.id
}

output "aws_kms_key_id" {
  description = "The id of the Customer-Managed KMS key encrypting the s3 backend"
  value       = aws_kms_key.s3_decrypt_key.id
}
