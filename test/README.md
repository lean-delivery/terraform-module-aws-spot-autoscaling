# aws-spot-autoscaling test

## Description

In this .go-file include 4 tests: Simple create/destroy test, creating standart ASG autoscaling_group with SimpleAlarmScaling_policy, creating standart ASG autoscaling_group with SimpleScaling_policys and creating spot ASG with windows-AMI

## List of created resources

| Resource | Count |
|------|---|
| aws_autoscaling_policy | 0/n |
| aws_cloudwatch_metric_alarm | 0/n |
| aws_autoscaling_group | 1 |
| Security Group | 1 |
| Launch Configuration | 1 |
| Instance | 0/n |


## List of created resources for env

| Resource | Count |
|------|---|
| VPC | 1/n |
| subnets | n |

## Usage

```
go test
```

## Run Time

320s - 480s


## Require Inputs

| Variable | Description | Type | Example value |
|------|-------------|:----:|:-----:|
| vpc_zone_identifier | A list of subnets | map of string | []string{"subnet-00000000", "subnet-11111111", "subnet-22222222"} |
| health_check_type | Controls how health checking is done. Values are - EC2 and ELB | string | "EC2" |
| ami_id | The EC2 image ID to launch | string | "ami-00000000000000000" |


## Permissions

| Permission |
|------|
| autoscaling:CreateLaunchConfiguration |
| autoscaling:CreateAutoScalingGroup |
| autoscaling:UpdateAutoScalingGroup |
| autoscaling:ImageId |
| autoscaling:InstanceType |
| autoscaling:InstanceTypes |
| autoscaling:LaunchConfigurationName |
| autoscaling:LaunchTemplateVersionSpecified |
| autoscaling:LoadBalancerNames |
| autoscaling:MaxSize |
| autoscaling:MinSize |
| autoscaling:ResourceTag/key |
| autoscaling:SpotPrice |
| autoscaling:TargetGroupARNs |
| autoscaling:VPCZoneIdentifiers |
| autoscaling:Scaling |
| autoscaling:Trigger |
| cloudwatch:EnableAlarmActions |
| cloudwatch:PutMetricAlarm |
| cloudwatch:PutMetricData |
| cloudwatch:SetAlarmState |
| ec2:AuthorizeSecurityGroupEgress |
| ec2:AuthorizeSecurityGroupIngress |
| ec2:DeleteSecurityGroup |
| ec2:RevokeSecurityGroupEgress |
| ec2:RevokeSecurityGroupIngress |
| ec2:DescribeImages |
| ec2:DescribeInstances |
| ec2:DescribeInstanceAttribute |
| ec2:DescribeKeyPairs |
| ec2:DescribeSecurityGroups |
| ec2:DescribeSpotInstanceRequests |
| ec2:DescribeVpcClassicLink |
| ec2:AccepterVpc |
| ec2:Region |
| ec2:RequesterVpc |
| ec2:ResourceTag/tag-key |
| ec2:AuthorizedUser |
| ec2:AvailabilityZone |
| ec2:Permission |
| ec2:Subnet |
| ec2:Vpc |
| ec2:Encrypted |
| ec2:ParentSnapshot |
| ec2:VolumeIops |
| ec2:VolumeSize |
| ec2:VolumeType |

or

| Permission |
|------|
| autoscaling:* |
| cloudwatch:* |
| ec2:* |



## Terraform versions

Terraform v0.11.13

## Golang versions

go version go1.12 darwin/amd64


## Contributing

Thank you for your interest in contributing! Please refer to [CONTRIBUTING.md](https://github.com/lean-delivery/tf-module-aws-spot-autoscaling/blob/master/CONTRIBUTING.md) for guidance.

## License

Apache

## Authors

authors:
  - Lean Delivery Team <team@lean-delivery.com>
