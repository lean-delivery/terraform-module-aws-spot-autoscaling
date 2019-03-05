module "ASGROUP" {
  source = "tf-module-aws-spot-autoscaling/"
  name   = "service"

  # Launch configuration
  lc_name = "example-lc"

  instance_type = "t2.micro"
  image_id      = "ami-01e08d22b9439c15a"

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "example-asg"
  vpc_zone_identifier       = ["subnet-8d79a2eb", "subnet-938b23db", "subnet-ecfc19b6"]
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  spot_price                = "0.1"

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "megasecret"
      propagate_at_launch = true
    },
  ]

  tags_as_map = {
    extra_tag1 = "extra_value1"
    extra_tag2 = "extra_value2"
  }

  SimpleAlarmScaling_policys = [
    {
      estimated_instance_warmup = ""
      adjustment_type           = "ChangeInCapacity"
      policy_type               = "SimpleScaling"
      cooldown                  = "300"
      scaling_adjustment        = "0"
      alarm_name                = "alarm"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = "2"
      alarm_metric_name         = "CPUUtilization"
      alarm_period              = "120"
      alarm_threshold           = "80"
      alarm_description         = "This metric monitors ec2 cpu utilization"
    },
    {
      estimated_instance_warmup = ""
      adjustment_type           = "ExactCapacity"
      policy_type               = "SimpleScaling"
      cooldown                  = "250"
      scaling_adjustment        = "0"
      alarm_name                = "alarm"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = "2"
      alarm_metric_name         = "CPUUtilization"
      alarm_period              = "180"
      alarm_threshold           = "90"
      alarm_description         = "This metric monitors ec2 cpu utilization"
    },
  ]

  SimpleScaling_policys = [
    {
      estimated_instance_warmup = ""
      adjustment_type           = "ChangeInCapacity"
      policy_type               = "SimpleScaling"
      cooldown                  = "300"
      scaling_adjustment        = "0"
    },
  ]
}
