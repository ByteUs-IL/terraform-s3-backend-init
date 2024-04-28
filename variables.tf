variable "aws_region" {
  description = "The AWS region in which the infrastructure will be deployed."
  type        = string
}

variable "s3_backend" {
  type = object({
    name          = string
    create_bucket = optional(bool, true)

    versioning = optional(string, "Enabled")
  })
  description = "The configuration of the S3 backend that will hold the tf state files"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table that will hold the state lock"
  type        = string
}
