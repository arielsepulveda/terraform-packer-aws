HOW TO USE : 

1.- Copy terraform.tfvars.example as terraform.tfvars
2.- Edit with your AWS Key and Secret
3.- Create a key using : "ssh_keygen -f key" (will be used for EC2)
3.- Run: "sh BUILDNOW.sh"

WHAT IS DONE :

BUILDNOW.sh will get Key and Secret from terraform.tfvars file, and use it to create an AMI, with
software and updates installed.
The Packer log, will be on build.log, the AMI ID will be saved on amivar.tf, and will be used by 
terraform in the autoscale group.


