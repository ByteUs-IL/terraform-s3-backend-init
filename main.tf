# Create S3 bucket if it doesn't exists
module "s3" {
  source = "./Modules/S3-backend"
  count  = var.bucket.does_exists == true ? 0 : 1
  bucket = var.bucket
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
