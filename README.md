<h1>ByteUS' terraform-init</h1>

<p>This module deploys the Terraform Backend, which sets up prerequisite resources for a managed tfstate file. It includes creating an S3 bucket to host the tfstate file (with encryption and versioning enabled), a KMS key to encrypt the S3 bucket, a DynamoDB table to host a Lock object and a IAM policy that grants access to those resources. It can either create a new S3 bucket or utilize an existing one.</p>

<h2>Inputs</h2>

<p>The module requires the following inputs:</p>

<ul>
  <li><strong>aws_region</strong>: The AWS region in which the infrastructure will be deployed.</li>
  <li><strong>s3_backend</strong>: An object specifying details about the S3 bucket. It includes:
    <ul>
      <li><strong>name</strong>: (Optional) The name of the S3 bucket. Required if `create_bucket` is `true` or unspecified.</li>
      <li><strong>create_bucket</strong>: (Optional) A boolean value indicating whether to create a new bucket (<code>true</code>) or use an existing one (<code>false</code>). Default is <code>true</code>.</li>
      <li><strong>versioning</strong>: (Optional) The versioning configuration for the S3 bucket. Options include <code>"Enabled"</code>, <code>"Suspended"</code>, or <code>"Disabled"</code>. Default is <code>"Enabled"</code>.</li>
    </ul>
    <p><strong>Note:</strong> Input validation ensures that a bucket name must be specified if `create_bucket` is `true` or unspecified.</p>
  </li>
  <li><strong>dynamodb_table_name</strong>: The name of the DynamoDB table that will hold the state lock.</li>
  <li><strong>iam_policy_name</strong>: The name of the IAM policy that grants access to the backend resources.</li>
</ul>

<h2>Outputs</h2>

<p>The module provides the following outputs:</p>

<ul>
  <li><strong>aws_kms_key_arn</strong>: The arn of the Customer-Managed KMS key encrypting the S3 backend.</li>
  <li><strong>aws_s3_bucket_id</strong>: The id (name) of the S3 bucket holding the state file.</li>
  <li><strong>aws_dynamodb_table_arn</strong>: The arn of DynamoDB table holding the state lock.</li>
  <li><strong>iam_policy_arn</strong>: The arn of the IAM policy that grants access to the backend resources.</li>
</ul>

<p>~ Kurtz takes credit ~</p>

</body>
</html>
