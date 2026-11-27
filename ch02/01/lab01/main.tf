resource "aws_security_group" "web" {
    name = local.sg_name
    description = local.sg_web_description
}

# resource "aws_instance" "this" {
#     security_groups = [aws_security_group.web.id]
# }