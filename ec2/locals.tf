locals {
  instance_type = "t3.small"
  environment = "dev"
  region = "us-east-1"

  instance-name = "${local.environment}-jenkis-agent"

  comman_tags = {
    project = "Terraform Demo"
    environment = local.environment
    ManagedBy = "Terraform"
    instance_name = local.instance-name
  }
}
