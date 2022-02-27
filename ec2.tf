resource "aws_instance" "web1" {

    # Zone dependent AMI id collection from launch instances
    ami           = "ami-0ed9277fb7eb570c9"
    instance_type = "t2.micro"

    # VPC
    subnet_id = aws_subnet.prod-subnet-public-1.id

    # Security Group
    vpc_security_group_ids = [aws_security_group.ssh-allowed.id]

    # the Public SSH key
    key_name = aws_key_pair.virginia-region-key-pair.id

    # nginx installation
    provisioner "file" {
        source = "nginx.sh"
        destination = "/tmp/nginx.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/nginx.sh",
            "sudo /tmp/nginx.sh"
        ]
    }

    connection {
        host = self.public_ip
        user = var.EC2_USER
        private_key = file(var.PRIVATE_KEY_PATH)
    }
}

resource "aws_key_pair" "virginia-region-key-pair" {
    key_name = "virginia-region-key-pair"
    public_key = file(var.PUBLIC_KEY_PATH)
}

data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web1.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web1.public_ip
}