https://www.terraform.io/ <br>
https://registry.terraform.io/ <br>
https://github.com/hashicorp/terraform <br>
https://github.com/terraform-providers <br>
https://github.com/segmentio/terraform-docs <br>

## terraformインストール・設定(Linux)
#wget https://releases.hashicorp.com/terraform/0.11.0/terraform_0.11.0_linux_amd64.zip
#unzip terraform_0.11.0_linux_amd64.zip
#rm terraform_0.11.0_linux_amd64.zip
#mkdir /usr/local/terrarom/bin
#mv terrarom /usr/local/terrarom/bin/
#export PATH=$PATH:/usr/local/terrarom/bin/


#vim terraform.tfvars
#cat terraform.tfvars
aws_access_key = "アクセスキー情報"
aws_secret_key = "シークレットキー情報"

#terraform init
#terraform plan
#terraform apply
#terraform show
#terraform destroy
