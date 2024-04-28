variable "bucket" {
  type = object({
    name        = string
    does_exists = bool
  })
  description = "the name of S3 bucket and if it exits"
  default     = { name = "tfstate-byte-me", does_exists = false }
}

variable "s3_decrypt_key_name" {
  type        = string
  description = "the kms key ARN to decrypt the tfstate file"
  default     = "tfstate_s3_decrypt_key"
}

variable "dynamodb_table_name" {
  type        = string
  description = "the name of the dynamodb table"
  default     = "terraform-state-lock"
}
