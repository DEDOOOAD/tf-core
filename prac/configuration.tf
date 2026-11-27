terraform {
  required_version = ">=1.17.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"

  default_tags {
    tags = {
      Organization = local.org
      Project      = local.project
      ManagedBy    = "Terraform"
    }
  }
}

locals {
  org     = "tf-core"
  project = "as01"

  namespace = local.project
}

locals {
  vpc = {
    name = "main"
    cidr = "10.0.0.0/16"
  }

  sg = {
    name        = "web"
    description = "as01 web security group"
  }
}

resource "aws_vpc" "main" {
  cidr_block = local.vpc.cidr

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${local.namespace}-vpc-${local.vpc.name}"
  }
}

resource "aws_security_group" "web" {
  name        = "${local.namespace}-sg-${local.sg.name}"
  description = local.sg.description
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "${local.namespace}-sg-${local.sg.name}"
  }
}

output "vpc" {
  value = {
      id = aws_vpc.main.id
      cidr_block = aws_vpc.main.cidr_block
  }
}

output "sg" {
  value = {
      id = aws_security_group.web.id
      name = aws_security_group.web.name
      vpc_id = aws_security_group.web.vpc_id
  }
}

