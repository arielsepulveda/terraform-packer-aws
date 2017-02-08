resource "aws_launch_configuration" "Web-launchconfig" {
  name_prefix          = "Web-launchconfig"
#  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  image_id             = "${var.AMI_ID}"
  instance_type        = "t2.micro"
  key_name             = "${aws_key_pair.myKEYPAIR.key_name}"
  security_groups      = ["${aws_security_group.Web-SG.id}"]
}

resource "aws_autoscaling_group" "Web-autoscaling" {
  name                 = "Web-autoscaling"
  vpc_zone_identifier  = ["${aws_subnet.myVPC-public-subnet-1.id}", "${aws_subnet.myVPC-public-subnet-2.id}"]
  launch_configuration = "${aws_launch_configuration.Web-launchconfig.name}"
  min_size             = 1
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  load_balancers = [ "${aws_elb.my-LB.id}" ]
  force_delete = true
  tag {
      key = "Name"
      value = "Web EC2 Instance "
      propagate_at_launch = true
  }
}
