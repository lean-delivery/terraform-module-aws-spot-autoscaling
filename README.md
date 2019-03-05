# tf-module-aws-spot-autoscaling

## Description

Creating autoscaling group on spots (or on standart instances) and add autoscaling policy to group

### Includes modules
 * terraform-aws-modules/autoscaling/aws
 * AS_policys

Automatically uses spot-instances if you set spot_price. Set param spot_price = "" to use standart instances
Module uses [terraform-aws-autoscaling](https://github.com/terraform-aws-modules/terraform-aws-autoscaling) from [Terraform AWS modules](https://github.com/terraform-aws-modules), and adds aws_autoscaling_policy for scaling ASG.

## Usage

```hcl
module "ASGROUP" {
  source = "tf-module-aws-spot-autoscaling/"

  name = "service"

  lc_name = "example-lc"

  instance_type   = "t2.micro"
  image_id        = "ami-01e08d22b9439c15a"

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

  asg_name                  = "example-asg"
  vpc_zone_identifier       = ["subnet-xxxxxxxx", "subnet-xxxxxxxx", "subnet-xxxxxxxx"]
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

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project | Project name will be used for naming resources in pattern %PROJECT_NAME%-%ENVIRONMENT_NAME% | "string" | "project" | no |
| environment | Environment name will be used for naming resources in pattern %PROJECT_NAME%-%ENVIRONMENT_NAME% | "string" | "test" | no |
| asg_name | Creates a unique name for autoscaling group beginning with the specified prefix | "string" | "" | no |
| associate_public_ip_address | Associate a public ip address with an instance in a VPC | "string" | false | no |
| create_asg | Whether to create autoscaling group | "string" | true | no |
| create_asg_with_initial_lifecycle_hook | Create an ASG with initial lifecycle hook | "string" | false | no |
| create_lc | Whether to create launch configuration | "string" | true | no |
| default_cooldown | The amount of time in seconds after a scaling activity completes before another scaling activity can start | "string" | "300" | no |
| desired_capacity | The number of Amazon EC2 instances that should be running in the group | "string" | "1" | no |
| ebs_block_device | Additional EBS block devices to attach to the instance | "list" | [] | no |
| ebs_optimized | If true the launched EC2 instance will be EBS-optimized | "string" | false | no |
| enable_monitoring | Enables/disables detailed monitoring. This is enabled by default | "string" | true | no |
| enabled_metrics | A list of metrics to collect. The allowed values are GroupMinSize GroupMaxSize GroupDesiredCapacity GroupInServiceInstances GroupPendingInstances GroupStandbyInstances GroupTerminatingInstances GroupTotalInstances | "list" | [] | no |
| ephemeral_block_device | Customize Ephemeral (also known as 'Instance Store') volumes on the instance | "list" | [] | no |
| force_delete | Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling | "string" | false | no |
| health_check_grace_period | Time (in seconds) after instance comes into service before checking health | "string" | "300" | no |
| health_check_type | Controls how health checking is done. Values are - EC2 and ELB | "string" | - | yes |
| iam_instance_profile | The IAM instance profile to associate with launched instances | "string" | "" | no |
| image_id | The EC2 image ID to launch | "string" | "" | no |
| initial_lifecycle_hook_default_result | Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON | "string" | "ABANDON" | no |
| initial_lifecycle_hook_heartbeat_timeout | Defines the amount of time in seconds that can elapse before the lifecycle hook times out. When the lifecycle hook times out Auto Scaling performs the action defined in the DefaultResult parameter | "string" | "60" | no |
| initial_lifecycle_hook_lifecycle_transition | The instance state to which you want to attach the initial lifecycle hook | "string" | "" | no |
| initial_lifecycle_hook_name | The name of initial lifecycle hook | "string" | "" | no |
| initial_lifecycle_hook_notification_metadata | Contains additional information that you want to include any time Auto Scaling sends a message to the notification target | "string" | "" | no |
| initial_lifecycle_hook_notification_target_arn | The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic | "string" | "" | no |
| initial_lifecycle_hook_role_arn | The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target | "string" | "" | no |
| instance_type | The size of instance to launch | "string" | "" | no |
| key_name | The key name that should be used for the instance | "string" | "" | no |
| launch_configuration | The name of the launch configuration to use (if it is created outside of this module) | "string" | "" | no |
| lc_name | Creates a unique name for launch configuration beginning with the specified prefix | "string" | "" | no |
| load_balancers | A list of elastic load balancer names to add to the autoscaling group names | "list" | [] | no |
| max_size | The maximum size of the auto scale group | "string" | "1" | no |
| metrics_granularity | The granularity to associate with the metrics to collect. The only valid value is 1Minute | "string" | "1Minute" | no |
| min_elb_capacity | Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes | "string" | "0" | no |
| min_size | The minimum size of the auto scale group | "string" | "0" | no |
| name | Creates a unique name beginning with the specified prefix | "string" | "" | no |
| placement_group | The name of the placement group into which you'll launch your instances if any | "string" | "" | no |
| placement_tenancy | The tenancy of the instance. Valid values are 'default' or 'dedicated' | "string" | "default" | no |
| protect_from_scale_in | Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events | "string" | false | no |
| recreate_asg_when_lc_changes | Whether to recreate an autoscaling group when launch configuration changes | "string" | false | no |
| root_block_device | Customize details about the root block device of the instance | "list" | [] | no |
| security_groups | A list of security group IDs to assign to the launch configuration | "list" | [] | no |
| spot_price | The price to use for reserving spot instances | "string" | "" | no |
| suspended_processes | A list of processes to suspend for the AutoScaling Group. The allowed values are Launch Terminate HealthCheck ReplaceUnhealthy AZRebalance AlarmNotification ScheduledActions AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types it can prevent your autoscaling group from functioning properly | "list" | [] | no |
| tags | A list of tag blocks. Each element should have keys named key value and propagate_at_launch | "list" | [] | no |
| tags_as_map | A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws_autoscaling_group requires | "map" |  | - | yes | | no |
| target_group_arns | A list of aws_alb_target_group ARNs for use with Application Load Balancing | "list" | [] | no |
| termination_policies | A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance NewestInstance OldestLaunchConfiguration ClosestToNextInstanceHour Default | "list" | [] | no |
| user_data | The user data to provide when launching the instance | "string" | "echo 0" | no |
| vpc_zone_identifier | A list of subnet IDs to launch resources in | "list" | - | yes |
| wait_for_capacity_timeout | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior | "string" | "10m" | no |
| wait_for_elb_capacity | Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers on both create and update operations. Takes precedence over min_elb_capacity behavior | "string" | false | no |
| SimpleScaling_policys | A list of AS-policys. Trigger for scaling ASG. Only policy_type SimpleScaling | "list" | [] | no |
| SimpleAlarmScaling_policys | A list of AS-policys. Trigger for scaling ASG. Only policy_type SimpleScaling | "list" | [] | no |
| StepScaling_policys | A list of AS-policys. Trigger for scaling ASG. Only policy_type StepScaling | "list" | [] | no |
| TargetTracking_policys | A list of AS-policys. Trigger for scaling ASG. Only policy_type TargetTrackingScaling | "list" | [] | no |


## Outputs

| Name | Description |
|------|-------------|
| this_autoscaling_group_arn |  The ARN for this AutoScaling Group |
| this_autoscaling_group_default_cooldown | Time between a scaling activity and the succeeding scaling activity |
| this_autoscaling_group_desired_capacity | The number of Amazon EC2 instances that should be running in the group |
| this_autoscaling_group_health_check_grace_period |  Time after instance comes into service before checking health |
| this_autoscaling_group_health_check_type |  EC2 or ELB. Controls how health checking is done |
| this_autoscaling_group_id | The autoscaling group id |
| this_autoscaling_group_max_size | The maximum size of the autoscale group |
| this_autoscaling_group_min_size | The minimum size of the autoscale group |
| this_autoscaling_group_name | The autoscaling group name |
| this_launch_configuration_id |  The ID of the launch configuration |
| this_launch_configuration_name |  The name of the launch configuration |
| simpleAlarm_id | List of The ID-s of the health check for simpleAlarm_policy_alarm |
| stepAlarm_id | List of The ID-s of the health check for step_policy_alarm |
| SimpleScaling_ASG_policy_arn | List of The ARN assigneds by AWS to the scaling policy for SimpleScaling_ASG_policy |
| SimpleAlarmScaling_ASG_policy_arn | List of The ARN assigneds by AWS to the scaling policy for SimpleAlarmScaling_ASG_policy |
| StepScaling_ASG_policy_arn | List of The ARN assigneds by AWS to the scaling policy for StepScaling_ASG_policy |
| TargetTracking_ASG_policy_arn | List of The ARN assigneds by AWS to the scaling policy for TargetTracking_ASG_policy |
| SimpleScaling_ASG_policy_name | List of The scaling policys name for SimpleScaling_ASG_policy |
| SimpleAlarmScaling_ASG_policy_name | List of The scaling policys name for SimpleAlarmScaling_ASG_policy |
| StepScaling_ASG_policy_name | List of The scaling policys name for StepScaling_ASG_policy |
| TargetTracking_ASG_policy_name | List of The scaling policys name for TargetTracking_ASG_policy |
| SimpleScaling_ASG_policy_adjustment_type | List of The scaling policys adjustment type for SimpleScaling_ASG_policy |
| SimpleAlarmScaling_ASG_policy_adjustment_type | List of The scaling policys adjustment type for SimpleAlarmScaling_ASG_policy |
| StepScaling_ASG_policy_adjustment_type | List of The scaling policys adjustment type for StepScaling_ASG_policy |
| TargetTracking_ASG_policy_adjustment_type | List of The scaling policys adjustment type for TargetTracking_ASG_policy |
| SimpleScaling_ASG_policy_group_name | List of The scaling policys assigned autoscaling group for SimpleScaling_ASG_policy |
| SimpleAlarmScaling_ASG_policy_group_name | List of The scaling policys assigned autoscaling group for SimpleAlarmScaling_ASG_policy |
| StepScaling_ASG_policy_group_name | List of The scaling policys assigned autoscaling group for StepScaling_ASG_policy |
| TargetTracking_ASG_policy_group_name | List of The scaling policys assigned autoscaling group for TargetTracking_ASG_policy |
| SimpleScaling_ASG_policy_policy_type | List of The scaling policys type for SimpleScaling_ASG_policy |
| SimpleAlarmScaling_ASG_policy_policy_type | List of The scaling policys type for SimpleAlarmScaling_ASG_policy |
| StepScaling_ASG_policy_policy_type | List of The scaling policys type for StepScaling_ASG_policy |
| TargetTracking_ASG_policy_policy_type | List of The scaling policys type for TargetTracking_ASG_policy |


## Terraform versions
Terraform v0.11.11

## Contributing


## License
Apache

## Authors
Lean Delivery Team team@lean-delivery.com
