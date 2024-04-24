# KMS key to decrypt the S3
resource "aws_kms_key" "s3_decrypt_key" {
  count = var.bucket.does_exists ? 1 : 0
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags = {
    Name        = var.s3_decrypt_key
    Environment = "Dev"
    terraform   = true
  }
}

# Create S3 bucket if it doesn't exist
resource "aws_s3_bucket" "backend" {
  count = var.bucket.does_exists ? 1 : 0
  bucket = var.bucket.name
  force_destroy = true
  tags = {
    Name        = var.bucket.name
    Environment = "Dev"
    terraform   = true
  }
}

# Block public access
resource "aws_s3_bucket_public_access_block" "backend" {
  count = var.bucket.does_exists ? 1 : 0
  bucket = aws_s3_bucket.backend[0].id
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

# Enable S3 versioning
resource "aws_s3_bucket_versioning" "backend" {
  count = var.bucket.does_exists ? 1 : 0
  bucket   = aws_s3_bucket.backend[0].id
  versioning_configuration {
    status = "Enabled"
  }
}

# Encrypt bucket with the KMS key
resource "aws_s3_bucket_server_side_encryption_configuration" "backend" {
  count = var.bucket.does_exists ? 1 : 0
  bucket = aws_s3_bucket.backend[0].id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_decrypt_key[0].arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Create DynamoDB table
resource "aws_dynamodb_table" "backend" {
  name           = var.dynamodb_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = "30"
  write_capacity = "30"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }  
  tags = {
    Name         = var.dynamodb_table_name
    Environment  = "Dev"
    terraform    = true
  }
}