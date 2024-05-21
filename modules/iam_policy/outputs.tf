output "iam_policy_id" {
  description = "The id of the IAM policy that will grant the access to the backend components"
  value = aws_iam_policy.access_backend.id
}