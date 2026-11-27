resource "aws_iam_role" "instance" {
  name = "${local.namespace}-iamrole-instance"

  assume_role_policy = jsonencode({
    Version: "2012-10-17"
    Statement: [{
      Effect: "Allow"
      Action: "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
        }
    }]
  })

  tags = {
    Name = "${local.namespace}-iamrole-instance"
  }
}

resource "aws_iam_role_policy_attachment" "instance" {
  role = aws_iam_role.instance.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "instance" {
  name = "${local.namespace}-iamprofile-instance"
  role = aws_iam_role.instance.name

  tags = {
    Name = ""
  }
}

resource "aws_security_group" "instance" {
  name = "${local.namespace}-sg-instance"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"          # type = string 모든 프로토콜
    cidr_blocks = ["10.0.0.0/16"]
  }
  
  tags = {
    Name = "${local.namespace}-sg-instance"
  }
}


resource "aws_instance" "ssm_test" {
  ami = "ami-0ada8527e6dc686a3"
  instance_type = "t3.small"
  vpc_security_group_ids = [ aws_security_group.instance.id ]
  iam_instance_profile = aws_iam_instance_profile.instance.name

  depends_on = [aws_iam_role_policy_attachment.instance]

  tags = {
    Name = "${local.namespace}-instance-ssm-test"
  }
}
