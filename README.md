# terraform-init
The module deploys Terraform-Backend which is the prerequisites resources for a managed tfstate file.
It deploys: S3 bucket to host the tfstate file (with encryption and versioning enabled), a KMS key to encrypt the S3, and a dynamoDB table to host a Lock object.
It can create a new S3 bucket or receive an existing one.

## inputs
The module must receive an object of a bucket - defining the bucket's name and it's existsance.
It can also get: dynamodb_table_name, s3_decrypt_key_name.

### Example of creating new bucket (tfvars file)
```
bucket = {
    name = "tfstate-byte-me-123", 
    does_exists = false
    }
dynamodb_table_name = "backend-tfstate-table"
```
### Example of using existing bucket (tfvars file)
```
bucket = {
    name = "terraform-backend-s3-test", 
    does_exists = true
    }
dynamodb_table_name = "backend-tfstate-table"
```

## outputs
The module returns the aws_s3_bucket_arn, aws_dynamodb_table_arn, and aws_kms_key_id.

### ~ Kurtz takes credit ~