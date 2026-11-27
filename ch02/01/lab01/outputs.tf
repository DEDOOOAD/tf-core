output "sg_web" {  
    value = {
        id = aws_security_group.web.id
        arn = aws_security_group.web.arn
        name = aws_security_group.web.name
        description = aws_security_group.web.description
    }
}