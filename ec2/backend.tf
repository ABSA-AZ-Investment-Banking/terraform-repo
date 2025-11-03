terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1" # or your region
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}