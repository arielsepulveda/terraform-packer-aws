![terraform](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

## How to use:

* Copy terraform.tfvars.example as terraform.tfvars
* Edit with your AWS Key and Secret
* Create a key using : "ssh_keygen -f key" (will be used for EC2)
* Run: "sh BUILDNOW.sh"

## What does it do:

BUILDNOW.sh will get Key and Secret from terraform.tfvars file, and use it to create an AMI, with
software and updates installed.
The Packer log, will be on build.log, the AMI ID will be saved on amivar.tf, and will be used by
terraform in the autoscale group.

Note: This may incurr charges in your AWS account, as this terraform will create a complete infrastructure on AWS, including VPC, Security Groups, AutoScaling Group, Load Balancer, etc and run the autoscaling with the created AMI (wich have a httpd with a "Online!" index only).
