resource "aws_elb" "my-LB" {
  name = "my-LB"
  subnets = ["${aws_subnet.myVPC-public-subnet-1.id}", "${aws_subnet.myVPC-public-subnet-2.id}","${aws_subnet.myVPC-public-subnet-3.id}"]
  security_groups = ["${aws_security_group.LB-SG.id}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/healthy.txt"
    interval = 30
  }
  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "my-LB"
  }
}
