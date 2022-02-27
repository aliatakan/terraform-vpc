file=./virginia-region-key-pair
if [ ! -e "$file" ]; then
    ssh-keygen -f virginia-region-key-pair
fi

terraform init
(($? != 0)) && { printf '%s\n' "Command exited with non-zero"; exit 1; }
terraform plan -out terraform.out
(($? != 0)) && { printf '%s\n' "Command exited with non-zero"; exit 1; }
terraform apply terraform.out
(($? != 0)) && { printf '%s\n' "Command exited with non-zero"; exit 1; }