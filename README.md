# terraform-vpc
Terraform, Infrastructure as Code! 

Terraform installation
[Terraform cli installation](https://learn.hashicorp.com/tutorials/terraform/install-cli)
[Good Links](https://www.endava.com/en/blog/Engineering/2019/11-Things-I-wish-I-knew-before-working-with-Terraform-I)
[Amit images](https://uec-images.ubuntu.com/query/bionic/server/released.txt)
[Original Links](https://medium.com/@aliatakan/terraform-create-a-vpc-subnets-and-more-6ef43f0bf4c1)

It creates; 
* 1 VPC, 
* 1 public subnet, 
* 1 Internet Gateway, 
* 1 Security Group
* 1 EC2 (installed a nginx in it)

After cloning the repo, just run these 3 commands

```
ssh-keygen -f virginia-region-key-pair
terraform init
terraform plan -out terraform.out
terraform apply terraform.out

ssh -i "virginia-region-key-pair" ubuntu@18.132.16.213

terraform destroy -auto-approve
```