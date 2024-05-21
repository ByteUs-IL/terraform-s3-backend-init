# Create S3 bucket if it doesn't exists
module "s3_backend" {
  source = "./modules/s3_backend"
  count  = var.s3_backend.create_bucket ? 1 : 0

  s3_backend = var.s3_backend
}

# Create DynamoDB table
resource "aws_dynamodb_table" "backend" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# Create IAM Policy that grant access to the created bucket, KMS key and the dynamodb table
module "iam_policy" {
  source               = "./modules/iam_policy"
  count                = var.s3_backend.create_bucket ? 1 : 0
  name                 = var.iam_policy_name
  s3_bucket_name       = one(module.s3_backend[*].s3_bucket_id)
  kms_key_arn          = one(module.s3_backend[*].kms_key_arn)
  dynamodb_table_name  = aws_dynamodb_table.backend.name
  dynamodb_table_arn   = aws_dynamodb_table.backend.arn
}