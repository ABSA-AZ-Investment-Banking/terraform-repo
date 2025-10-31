locals {
  instance_type = "t3.small"
  environment = "dev"
  region = "us-east-1"

  comman_tags = {
    project = "Terraform Demo"
    environment = local.environment
    ManagedBy = "Terraform"
  }

    instance_name = "${local.environment}-jenkis-agent"
}
