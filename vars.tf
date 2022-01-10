variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PRIVATE_KEY_PATH" {
  default = "london-region-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "london-region-key-pair.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}
variable "AMI" {
  type = map

  default =  {
    us-east-1 = "ami-0d37e07bd4ff37148"
    us-east-2 = "ami-0c2a1acae6667e438"
  }
}