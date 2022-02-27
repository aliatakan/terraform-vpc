variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PRIVATE_KEY_PATH" {
  default = "virginia-region-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "virginia-region-key-pair.pub"
}

variable "EC2_USER" {
  # need to change to the user in case of ubuntu user = "ubuntu"
  default = "ec2-user" 
}
variable "AMI" {
  type = map

  default =  {
    us-east-1 = "ami-0d37e07bd4ff37148"
    us-east-2 = "ami-0c2a1acae6667e438"
  }
}