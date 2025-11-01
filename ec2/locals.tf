locals {
  instance_type = "t3.small"
  environment = "dev"
  region = "us-east-1"

  instance_name = "${local.environment}-jenkis-agent"

  comman_tags = {
    project = "Terraform Demo"
    environment = local.environment
    ManagedBy = "Terraform"
    Name = local.instance_name
  }
}
