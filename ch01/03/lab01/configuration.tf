terraform{
    required_version = ">= 1.17.0"

    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

provider "aws" {
    region = "ap-northeast-2"
}

# 주석으로 처리된 것은 destory 처리되니까 확인 필요
resource "aws_security_group" "web" {
    name = "tf-core-lab01-sg-web"
}

resource "aws_security_group" "web3" {
    name = "tf-core-lab01-sg-web3"
}
