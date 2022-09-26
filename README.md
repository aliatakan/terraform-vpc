# terraform-vpc
Terraform, Infrastructure as Code! 

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
```

or 
```
export AWS_SECRET_ACCESS_KEY=<YOUR-SECRET_ACCESS_KEY>
export AWS_ACCESS_KEY_ID=<YOUR-ACCESS_KEY_ID>
ssh-keygen -f london-region-key-pair
terraform init
terraform plan -out terraform.out
```
this will ask for the path of your ssh-keys.

something like : /home/user/london-region-key-pair

something like : /home/user/london-region-key-pair.pub

```
terraform apply terraform.out
```





