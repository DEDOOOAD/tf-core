resource "aws_security_group" "web" {
  name = "${local.namespace}-sg-web"
  description = "description"

  tags = {
    Name = "${local.namespace}-sg-web"
  }
}