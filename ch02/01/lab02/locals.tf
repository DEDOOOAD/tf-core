locals {
  instance_type = var.env == "Dev" ? "t3.micro" : "t3.large"
}