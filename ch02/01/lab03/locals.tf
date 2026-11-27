locals {
  org     = "tf-core"
  project = "lab03"

  namespace = "${local.org}-${local.project}"

  sg = {
    name = format("%s-%s-sg-web", local.org, local.project)

    tags = {
      Name = join("-", [local.org, local.project, "sg", "Web"])
    }
  }
  instance = {
    ami           = "ami-5351311241341"
    instance_type = var.env == "dev" ? "t3.large" : "t3.micro"

  }

}