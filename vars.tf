variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "PRIVATE_KEY_PATH" {}

variable "PUBLIC_KEY_PATH" {}

variable "EC2_USER" {
  default = "ubuntu"
}
variable "AMI" {
  type = map(string)

  default = {
    eu-west-2 = "ami-04842bc62789b682e"
    us-east-1 = "ami-0f540e9f488cfa27d"
  }
}