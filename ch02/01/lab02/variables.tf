variable "env" {
  type    = string
  default = "dev"
}

variable "emv_number" {
  type    = number
  default = 100
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
}

variable "cidr_blocks" {
  type = list(string)
  default = [ "10.10.0.0/16", "10.0.0.0/16" ]
}