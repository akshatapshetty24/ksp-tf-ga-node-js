terraform {
  backend "s3" {
    bucket         = "ksp-tf-ga-node-js-state-bucket"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "ksp-tf-ga-node-js-locks"
    encrypt        = true
  }
}
