# terraform-vpc
Terraform, Infrastructure as Code! 

Terraform installation
https://learn.hashicorp.com/tutorials/terraform/install-cli
https://uec-images.ubuntu.com/query/bionic/server/released.txt
https://medium.com/@aliatakan/terraform-create-a-vpc-subnets-and-more-6ef43f0bf4c1

It creates; 
* 1 VPC, 
* 1 public subnet, 
* 1 Internet Gateway, 
* 1 Security Group
* 1 EC2 (installed a nginx in it)

After cloning the repo, just run these 3 commands

```
ssh-keygen -f london-region-key-pair
terraform init
terraform plan -out terraform.out
terraform apply terraform.out

ssh -i "london-region-key-pair" ubuntu@ec2-18-170-35-15.eu-west-2.compute.amazonaws.com

terraform destroy
```