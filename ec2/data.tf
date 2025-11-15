data "aws_ami" "nexus_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["redhat-nexus-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}