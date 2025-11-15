terraform {
  backend "s3" {
    bucket        = "siva-terraform-state-bucket-dev"
    key           = "infra/terraform.tfstate"
    region        = "us-east-1"
    encrypt       = true
    use_lockfile  = true   # replaces dynamodb_table for lock file.
  }
}