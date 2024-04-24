output "aws_s3_bucket_arn" {
  value = aws_s3_bucket.backend[0].arn
}

output "aws_dynamodb_table_arn" {
  value = aws_dynamodb_table.backend.arn
}

output "aws_kms_key_id" {
  value = aws_kms_key.s3_decrypt_key[0].id
}