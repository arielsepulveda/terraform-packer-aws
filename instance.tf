# Create Simple Instance
resource "aws_instance" "bastionEC2" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  tags { Name = "Bastion" }

  # the VPC subnet
  subnet_id = "${aws_subnet.myVPC-public-subnet-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.Bastion-SG.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.myKEYPAIR.key_name}"
}
