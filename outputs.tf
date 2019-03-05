output "this_autoscaling_group_arn" {
  value       = "${module.asg.this_autoscaling_group_arn}"
  description = " The ARN for this AutoScaling Group"
}

output "this_autoscaling_group_default_cooldown" {
  value       = "${module.asg.this_autoscaling_group_default_cooldown}"
  description = "Time between a scaling activity and the succeeding scaling activity"
}

output "this_autoscaling_group_desired_capacity" {
  value       = "${module.asg.this_autoscaling_group_desired_capacity}"
  description = "The number of Amazon EC2 instances that should be running in the group"
}

output "this_autoscaling_group_health_check_grace_period" {
  value       = "${module.asg.this_autoscaling_group_health_check_grace_period}"
  description = " Time after instance comes into service before checking health"
}

output "this_autoscaling_group_health_check_type" {
  value       = "${module.asg.this_autoscaling_group_health_check_type}"
  description = " EC2 or ELB. Controls how health checking is done"
}

output "this_autoscaling_group_id" {
  value       = "${module.asg.this_autoscaling_group_id}"
  description = "The autoscaling group id"
}

output "this_autoscaling_group_max_size" {
  value       = "${module.asg.this_autoscaling_group_max_size}"
  description = "The maximum size of the autoscale group"
}

output "this_autoscaling_group_min_size" {
  value       = "${module.asg.this_autoscaling_group_min_size}"
  description = "The minimum size of the autoscale group"
}

output "this_autoscaling_group_name" {
  value       = "${module.asg.this_autoscaling_group_name}"
  description = "The autoscaling group name"
}

output "this_launch_configuration_id" {
  value       = "${module.asg.this_launch_configuration_id}"
  description = " The ID of the launch configuration"
}

output "this_launch_configuration_name" {
  value       = "${module.asg.this_launch_configuration_name}"
  description = " The name of the launch configuration"
}

output "simpleAlarm_id" {
  value       = "${module.AS_Policys.simpleAlarm_id}"
  description = "List of The ID-s of the health check for simpleAlarm_policy_alarm"
}

output "stepAlarm_id" {
  value       = "${module.AS_Policys.stepAlarm_id}"
  description = "List of The ID-s of the health check for step_policy_alarm"
}

output "SimpleScaling_ASG_policy_arn" {
  value       = "${module.AS_Policys.SimpleScaling_ASG_policy_arn}"
  description = "List of The ARN assigneds by AWS to the scaling policy for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_arn" {
  value       = "${module.AS_Policys.SimpleAlarmScaling_ASG_policy_arn}"
  description = "List of The ARN assigneds by AWS to the scaling policy for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_arn" {
  value       = "${module.AS_Policys.StepScaling_ASG_policy_arn}"
  description = "List of The ARN assigneds by AWS to the scaling policy for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_arn" {
  value       = "${module.AS_Policys.TargetTracking_ASG_policy_arn}"
  description = "List of The ARN assigneds by AWS to the scaling policy for TargetTracking_ASG_policy"
}

output "SimpleScaling_ASG_policy_name" {
  value       = "${module.AS_Policys.SimpleScaling_ASG_policy_name}"
  description = "List of The scaling policys name for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_name" {
  value       = "${module.AS_Policys.SimpleAlarmScaling_ASG_policy_name}"
  description = "List of The scaling policys name for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_name" {
  value       = "${module.AS_Policys.StepScaling_ASG_policy_name}"
  description = "List of The scaling policys name for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_name" {
  value       = "${module.AS_Policys.TargetTracking_ASG_policy_name}"
  description = "List of The scaling policys name for TargetTracking_ASG_policy"
}

output "SimpleScaling_ASG_policy_adjustment_type" {
  value       = "${module.AS_Policys.SimpleScaling_ASG_policy_adjustment_type}"
  description = "List of The scaling policys adjustment type for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_adjustment_type" {
  value       = "${module.AS_Policys.SimpleAlarmScaling_ASG_policy_adjustment_type}"
  description = "List of The scaling policys adjustment type for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_adjustment_type" {
  value       = "${module.AS_Policys.StepScaling_ASG_policy_adjustment_type}"
  description = "List of The scaling policys adjustment type for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_adjustment_type" {
  value       = "${module.AS_Policys.TargetTracking_ASG_policy_adjustment_type}"
  description = "List of The scaling policys adjustment type for TargetTracking_ASG_policy"
}

output "SimpleScaling_ASG_policy_group_name" {
  value       = "${module.AS_Policys.SimpleScaling_ASG_policy_group_name}"
  description = "List of The scaling policys assigned autoscaling group for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_group_name" {
  value       = "${module.AS_Policys.SimpleAlarmScaling_ASG_policy_group_name}"
  description = "List of The scaling policys assigned autoscaling group for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_group_name" {
  value       = "${module.AS_Policys.StepScaling_ASG_policy_group_name}"
  description = "List of The scaling policys assigned autoscaling group for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_group_name" {
  value       = "${module.AS_Policys.TargetTracking_ASG_policy_group_name}"
  description = "List of The scaling policys assigned autoscaling group for TargetTracking_ASG_policy"
}

output "SimpleScaling_ASG_policy_policy_type" {
  value       = "${module.AS_Policys.SimpleScaling_ASG_policy_policy_type}"
  description = "List of The scaling policys type for SimpleScaling_ASG_policy"
}

output "SimpleAlarmScaling_ASG_policy_policy_type" {
  value       = "${module.AS_Policys.SimpleAlarmScaling_ASG_policy_policy_type}"
  description = "List of The scaling policys type for SimpleAlarmScaling_ASG_policy"
}

output "StepScaling_ASG_policy_policy_type" {
  value       = "${module.AS_Policys.StepScaling_ASG_policy_policy_type}"
  description = "List of The scaling policys type for StepScaling_ASG_policy"
}

output "TargetTracking_ASG_policy_policy_type" {
  value       = "${module.AS_Policys.TargetTracking_ASG_policy_policy_type}"
  description = "List of The scaling policys type for TargetTracking_ASG_policy"
}
