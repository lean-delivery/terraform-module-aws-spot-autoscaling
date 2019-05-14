package test

import (
    "testing"
    // "fmt"
    "time"
    "math/rand"
    "github.com/gruntwork-io/terratest/modules/terraform"
    // "github.com/stretchr/testify/assert"
)

var terraformDirectory = "../examples"
var region             = "us-east-1"
var account            = ""
var name               = "test_name_" + randSeq(10)
var health_check       = "EC2"
var linuxAMI           = "ami-06b382aba6c5a4f2c"
var windowsAMI         = "ami-0204606704df03e7e"

func randSeq(n int) string {
    letters := []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    b := make([]rune, n)
    for i := range b {
        b[i] = letters[rand.Intn(len(letters))]
    }
    return string(b)
}


func TestSetUp(t *testing.T) {
    rand.Seed(time.Now().UnixNano())

    terraformOptions := &terraform.Options{
        TerraformDir: terraformDirectory,
        Vars: map[string]interface{}{
            "aws_region"         : region,
            "name"               : name,
            "health_check_type"  : health_check,
            "image_id"           : linuxAMI,
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.Init(t, terraformOptions)
    terraform.Apply(t, terraformOptions)
    account = terraform.Output(t, terraformOptions, "account_id")
}


func TestSimpleAlarmScaling(t *testing.T) {
    rand.Seed(time.Now().UnixNano())

	First_Policy := map[string]interface{}{
		"estimated_instance_warmup": "",
		"adjustment_type":           "ChangeInCapacity",
		"policy_type":               "SimpleScaling",
		"cooldown":                  "300",
		"scaling_adjustment":        "0",
		"alarm_name":                "alarm",
		"alarm_comparison_operator": "GreaterThanOrEqualToThreshold",
		"alarm_evaluation_periods":  "2",
		"alarm_metric_name":         "CPUUtilization",
		"alarm_period":              "120",
		"alarm_threshold":           "80",
		"alarm_description":         "This metric monitors ec2 cpu utilization",
	}

	Second_Policy := map[string]interface{}{
		"estimated_instance_warmup": "",
		"adjustment_type":           "ExactCapacity",
		"policy_type":               "SimpleScaling",
	   	"cooldown":                  "250",
		"scaling_adjustment":        "0",
		"alarm_name":                "alarm",
		"alarm_comparison_operator": "GreaterThanOrEqualToThreshold",
		"alarm_evaluation_periods":  "2",
		"alarm_metric_name":         "CPUUtilization",
		"alarm_period":              "180",
		"alarm_threshold":           "90",
		"alarm_description":         "This metric monitors ec2 cpu utilization",
	}

    terraformOptions := &terraform.Options{
        TerraformDir: terraformDirectory,
        Vars: map[string]interface{}{
            "aws_region"                : region,
            "name"                      : name,
            "health_check_type"         : health_check,
            "image_id"                  : linuxAMI,
            "SimpleAlarmScaling_policys": []map[string]interface{}{First_Policy, Second_Policy},
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.Init(t, terraformOptions)
    terraform.Apply(t, terraformOptions)
}

func TestSimpleScaling(t *testing.T) {
    rand.Seed(time.Now().UnixNano())

	First_Policy := map[string]interface{}{
		"estimated_instance_warmup": "",
		"adjustment_type":           "ChangeInCapacity",
		"policy_type":               "SimpleScaling",
		"cooldown":                  "300",
		"scaling_adjustment":        "0",
	}

    terraformOptions := &terraform.Options{
        TerraformDir: terraformDirectory,
        Vars: map[string]interface{}{
            "aws_region"           : region,
            "name"                 : name,
            "health_check_type"    : health_check,
            "image_id"             : linuxAMI,
            "SimpleScaling_policys": []map[string]interface{}{First_Policy},
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.Init(t, terraformOptions)
    terraform.Apply(t, terraformOptions)
}


func TestSpotAndWindowsAMI(t *testing.T) {
    rand.Seed(time.Now().UnixNano())

    terraformOptions := &terraform.Options{
        TerraformDir: terraformDirectory,
        Vars: map[string]interface{}{
            "aws_region"        : region,
            "name"              : name,
            "health_check_type" : health_check,
            "spot_price"        : "0.2",
            "image_id"          : windowsAMI,
        },
    }

    defer terraform.Destroy(t, terraformOptions)
    terraform.Init(t, terraformOptions)
    terraform.Apply(t, terraformOptions)
}
