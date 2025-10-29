terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}
#Provide authentication details for AWS
provider "aws" {
  region = "us-east-1"
}