variable "bucket" {
  type = object({
    name        = string
    does_exists = bool
  })
  description = "the name of S3 bucket and if it exits"
  default     = { name = "tfstate-byte-me", does_exists = false }
}

variable "dynamodb_table_name" {
  type        = string
  description = "the name of the dynamodb table"
  default     = "terraform-state-lock"
}
