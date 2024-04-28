variable "bucket" {
  type = object({
    name        = string
    does_exists = bool
  })
  description = "the name of S3 bucket and if it exits"
}
