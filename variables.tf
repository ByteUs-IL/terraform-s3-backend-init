variable "aws_region" {
  description = "The AWS region in which the infrastructure will be deployed."
  type        = string
}

variable "bucket" {
  type = object({
    name        = string
    does_exists = bool
  })
  description = "the name of S3 bucket and if it exits"
}

variable "dynamodb_table_name" {
  type        = string
  description = "the name of the dynamodb table"
}
