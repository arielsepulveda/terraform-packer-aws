#!/bin/bash
while read config equal value; do
    case $config in
        'AWS_ACCESS_KEY') KEY=${value//\"/} ;;
        'AWS_SECRET_KEY') SECRET=${value//\"/} ;;
    esac
done < terraform.tfvars

if [ $secret = "" ]; then
	echo -e "\e[31mERROR: \e[39mCant get Access/Secret from terraform.tfvars file."; exit
   else

   echo "Using AWS Key : $KEY from terraform.tfvars";

   COMMAND="packer build -machine-readable -var 'aws_access_key=$KEY' -var 'aws_secret_key=$SECRET' pack-me-now.json | tee build.log";
   eval $COMMAND;
   AMI_ID=`grep 'artifact,0,id' build.log | cut -d, -f6 | cut -d: -f2`

   echo $AMI_ID;
   echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf

   terraform apply

fi
