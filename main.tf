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
