output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "caller_arn" {
  value = "${data.aws_caller_identity.current.arn}"
}

output "caller_user" {
  value = "${data.aws_caller_identity.current.user_id}"
}

output "this_autoscaling_group_arn" {
  value = "${module.example_module.this_autoscaling_group_arn}"
}

output "this_autoscaling_group_default_cooldown" {
  value = "${module.example_module.this_autoscaling_group_default_cooldown}"
}

output "this_autoscaling_group_desired_capacity" {
  value = "${module.example_module.this_autoscaling_group_desired_capacity}"
}

output "this_autoscaling_group_health_check_grace_period" {
  value = "${module.example_module.this_autoscaling_group_health_check_grace_period}"
}

output "this_autoscaling_group_health_check_type" {
  value = "${module.example_module.this_autoscaling_group_health_check_type}"
}

output "this_autoscaling_group_id" {
  value = "${module.example_module.this_autoscaling_group_id}"
}

output "this_autoscaling_group_max_size" {
  value = "${module.example_module.this_autoscaling_group_max_size}"
}

output "this_autoscaling_group_min_size" {
  value = "${module.example_module.this_autoscaling_group_min_size}"
}

output "this_autoscaling_group_name" {
  value = "${module.example_module.this_autoscaling_group_name}"
}

output "this_launch_configuration_id" {
  value = "${module.example_module.this_launch_configuration_id}"
}

output "this_launch_configuration_name" {
  value = "${module.example_module.this_launch_configuration_name}"
}

output "simpleAlarm_id" {
  value = "${module.example_module.simpleAlarm_id}"
}

output "stepAlarm_id" {
  value = "${module.example_module.stepAlarm_id}"
}

output "SimpleScaling_ASG_policy_arn" {
  value = "${module.example_module.SimpleScaling_ASG_policy_arn}"
}

output "SimpleAlarmScaling_ASG_policy_arn" {
  value = "${module.example_module.SimpleAlarmScaling_ASG_policy_arn}"
}

output "StepScaling_ASG_policy_arn" {
  value = "${module.example_module.StepScaling_ASG_policy_arn}"
}

output "TargetTracking_ASG_policy_arn" {
  value = "${module.example_module.TargetTracking_ASG_policy_arn}"
}

output "SimpleScaling_ASG_policy_name" {
  value = "${module.example_module.SimpleScaling_ASG_policy_name}"
}

output "SimpleAlarmScaling_ASG_policy_name" {
  value = "${module.example_module.SimpleAlarmScaling_ASG_policy_name}"
}

output "StepScaling_ASG_policy_name" {
  value = "${module.example_module.StepScaling_ASG_policy_name}"
}

output "TargetTracking_ASG_policy_name" {
  value = "${module.example_module.TargetTracking_ASG_policy_name}"
}

output "SimpleScaling_ASG_policy_adjustment_type" {
  value = "${module.example_module.SimpleScaling_ASG_policy_adjustment_type}"
}

output "SimpleAlarmScaling_ASG_policy_adjustment_type" {
  value = "${module.example_module.SimpleAlarmScaling_ASG_policy_adjustment_type}"
}

output "StepScaling_ASG_policy_adjustment_type" {
  value = "${module.example_module.StepScaling_ASG_policy_adjustment_type}"
}

output "TargetTracking_ASG_policy_adjustment_type" {
  value = "${module.example_module.TargetTracking_ASG_policy_adjustment_type}"
}

output "SimpleScaling_ASG_policy_group_name" {
  value = "${module.example_module.SimpleScaling_ASG_policy_group_name}"
}

output "SimpleAlarmScaling_ASG_policy_group_name" {
  value = "${module.example_module.SimpleAlarmScaling_ASG_policy_group_name}"
}

output "StepScaling_ASG_policy_group_name" {
  value = "${module.example_module.StepScaling_ASG_policy_group_name}"
}

output "TargetTracking_ASG_policy_group_name" {
  value = "${module.example_module.TargetTracking_ASG_policy_group_name}"
}

output "SimpleScaling_ASG_policy_policy_type" {
  value = "${module.example_module.SimpleScaling_ASG_policy_policy_type}"
}

output "SimpleAlarmScaling_ASG_policy_policy_type" {
  value = "${module.example_module.SimpleAlarmScaling_ASG_policy_policy_type}"
}

output "StepScaling_ASG_policy_policy_type" {
  value = "${module.example_module.StepScaling_ASG_policy_policy_type}"
}

output "TargetTracking_ASG_policy_policy_type" {
  value = "${module.example_module.TargetTracking_ASG_policy_policy_type}"
}
