variable "name" {
  description = "The name of the IAM policy that will grant the access to the backend components"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 backend that holds the tf state files"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table that will hold the state lock"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "The arn of the DynamoDB table that will hold the state lock"
  type        = string
}

variable "kms_key_arn" {
  description = "The arn of the KMS key used to encrypt the terraform s3 backend bucket"
  type        = string
}