provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = var.bucket_name
}

resource "aws_dynamodb_table" "tf_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
