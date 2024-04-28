variable "s3_backend" {
  type = object({
    name          = string
    create_bucket = optional(bool, true)

    versioning = optional(string, "Enabled")
  })
  description = "the name of S3 bucket and if it exits"
}
