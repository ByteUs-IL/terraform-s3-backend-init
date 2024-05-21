
# Create IAM Policy that grant access to the created bucket, KMS key and the dynamodb table
resource "aws_iam_policy" "access_backend" {
  name = var.name
  description = "IAM policy to allow access to ${var.s3_bucket_name}, ${var.dynamodb_table_arn}, ${var.kms_key_arn}"
  path = "/"
  tags = {
    s3_bucket_name     = "${var.s3_bucket_name}"
    dynamodb_table_name = "${var.dynamodb_table_name}"
    }
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AccessTerraformStateBucket",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucket_name}/*",
                "arn:aws:s3:::${var.s3_bucket_name}"
            ]
        },
        {
            "Sid": "AccessTerraformStateKmsKey",
            "Effect": "Allow",
            "Action": [
                "kms:GenerateDataKey",
                "kms:Decrypt"
            ],
            "Resource": [
                "${var.kms_key_arn}"
            ]
        },
        {
            "Sid": "AccessTerraformDynamodbTable",
            "Effect": "Allow",
            "Action": [
                "dynamodb:GetItem",
                "dynamodb:PutItem",
                "dynamodb:DeleteItem"
            ],
            "Resource": [
                "${var.dynamodb_table_arn}"
            ]
        }
    ]
})
}