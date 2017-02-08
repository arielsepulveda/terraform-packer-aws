# A name to identify the VPC and resources.
variable "NAME" { default = "myVPC" }
# AWS Access Key
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
# AMI Var for Packer
# // defined in .sh // variable "AMI_ID" {}
# EC2 Access Keys
variable "EC2_PRIVATE_KEY"    { default = "key" }
variable "EC2_PUBLIC_KEY"     { default = "key.pub" }
# AWS Region
variable "AWS_REGION" {
  default = "eu-west-1"
}
# Amazon Linux AMI list.
variable "AMIS" {
  type = "map"
  default = {
			us-east-1       = "ami-9be6f38c"
			us-west-2       = "ami-1e299d7e"
			us-east-2       = "ami-38cd975d"
			us-west-1       = "ami-b73d6cd7"
			ca-central-1    = "ami-eb20928f"
			eu-west-1       = "ami-c51e3eb6"
			eu-central-1    = "ami-211ada4e"
			eu-west-2       = "ami-bfe0eadb"
			ap-northeast-1  = "ami-9f0c67f8"
			ap-northeast-2  = "ami-94bb6dfa"
			ap-southeast-2  = "ami-28cff44b"
			ap-southeast-1  = "ami-4dd6782e"
			ap-south-1      = "ami-9fc7b0f0"
			sa-east-1       = "ami-bb40d8d7"
  }
}

# Whole VPC IP Block
variable "VPC_CIDR"           { default = "10.0.0.0/16" }
# Public IP Blocks
variable "VPC_Public_CIDR_1"  { default = "10.0.1.0/24" }
variable "VPC_Public_CIDR_2"  { default = "10.0.2.0/24" }
variable "VPC_Public_CIDR_3"  { default = "10.0.3.0/24" }
# PRivate IP Blocks
variable "VPC_Private_CIDR_1" { default = "10.0.101.0/24" }
variable "VPC_Private_CIDR_2" { default = "10.0.102.0/24" }
variable "VPC_Private_CIDR_3" { default = "10.0.103.0/24" }
