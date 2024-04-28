# The expression first uses the splat operator [*] to transform the list of objects into a list of values, 
# which will also have either zero or one elements depending on the resource count.
# 
# The one function then deals with the two cases:
# If the list has only one value, it’ll return that value.
# If the list has no values, it’ll return null to represent the absense of a value.

output "aws_kms_key_id" {
  value = one(module.s3[*].aws_kms_key_id)
}

output "aws_s3_bucket_id" {
  value = one(module.s3[*].aws_s3_bucket_id)
}

output "aws_dynamodb_table_arn" {
  value = aws_dynamodb_table.backend.arn
}
