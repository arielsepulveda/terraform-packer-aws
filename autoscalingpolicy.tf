# Alarm to Scale UP
resource "aws_autoscaling_policy" "Web-cpu-policy" {
  name                   = "Web-cpu-policy"
  autoscaling_group_name = "${aws_autoscaling_group.Web-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}
resource "aws_cloudwatch_metric_alarm" "Web-cpu-alarm" {
  alarm_name          = "Web-cpu-alarm"
  alarm_description   = "Web-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "70"
  dimensions = {
        "AutoScalingGroupName" = "${aws_autoscaling_group.Web-autoscaling.name}"
  }
  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.Web-cpu-policy.arn}"]
}
# Alarm to Scale DOWN
resource "aws_autoscaling_policy" "Web-cpu-policy-scaledown" {
  name                   = "Web-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.Web-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}
resource "aws_cloudwatch_metric_alarm" "Web-cpu-alarm-scaledown" {
  alarm_name          = "Web-cpu-alarm-scaledown"
  alarm_description   = "Web-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "4"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "30"
  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.Web-autoscaling.name}"
  }
  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.Web-cpu-policy-scaledown.arn}"]
}
