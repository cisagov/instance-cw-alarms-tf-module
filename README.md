# instance-cw-alarms-tf-module #

[![GitHub Build Status](https://github.com/cisagov/instance-cw-alarms-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/instance-cw-alarms-tf-module/actions)

A Terraform module for creating a set of standard CloudWatch alarms
for EC2 instances.

## Usage ##

```hcl
module "example" {
  source = "github.com/cisagov/instance-cw-alarms-tf-module"

  alarm_actions             = ["arn:aws:sns:us-east-1:111122223333:my-topic"]
  instance_ids              = ["id-0123456789abcdef0", "id-0123456789abcdef1"]
  insufficient_data_actions = ["arn:aws:sns:us-east-1:111122223333:my-topic"]
  ok_actions                = ["arn:aws:sns:us-east-1:111122223333:my-topic"]
}
```

## Examples ##

- [Basic usage](https://github.com/cisagov/instance-cw-alarms-tf-module/tree/develop/examples/basic_usage)

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.bw_in_allowance_exceeded](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.bw_out_allowance_exceeded](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.conntrack_allowance_exceeded](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_utilization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.disk_utilization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.imdsv1_request](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.instance_status_check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.linklocal_allowance_exceeded](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_utilization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.pps_allowance_exceeded](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.system_status_check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_actions | A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the ALARM state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic]). | `list(string)` | `[]` | no |
| cpu\_utilization\_alarm\_parameters | An object containing the parameters for the CPU utilization alarm (e.g. {create\_alarm = true, datapoints\_to\_alarm = 6, evaluation\_periods = 6, period = 300, statistic = "Maximum", threshold = 90.0}).  See [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm after 30 straight minutes of over 90% CPU utilization. | `object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })` | ```{ "create_alarm": true, "datapoints_to_alarm": 6, "evaluation_periods": 6, "period": 300, "statistic": "Maximum", "threshold": 90 }``` | no |
| create\_cloudwatch\_agent\_alarms | A Boolean value indicating whether or not to create alarms based on CloudWatch metrics written by the CloudWatch Agent.  You will generally want this variable to be set to true; it should only be set to false for instances which are not running the CloudWatch Agent. | `bool` | `true` | no |
| disk\_utilization\_alarm\_parameters | An object containing the parameters for the disk utilization alarm (e.g. {create\_alarm = true, datapoints\_to\_alarm = 1, evaluation\_periods = 1, period = 60, statistic = "Maximum", threshold = 90.0}).  See [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm for greater than 90% disk utilization. | `object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })` | ```{ "create_alarm": true, "datapoints_to_alarm": 1, "evaluation_periods": 1, "period": 300, "statistic": "Maximum", "threshold": 90 }``` | no |
| instance\_ids | A list of AWS EC2 instance IDs that are to be monitored (e.g. [id-0123456789abcdef0, id-0123456789abcdef1]). | `list(string)` | n/a | yes |
| insufficient\_data\_actions | A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the INSUFFICIENT\_DATA state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic]). | `list(string)` | `[]` | no |
| memory\_utilization\_alarm\_parameters | An object containing the parameters for the memory utilization alarm (e.g. {create\_alarm = true, datapoints\_to\_alarm = 6, evaluation\_periods = 6, period = 300, statistic = "Maximum", threshold = 90.0}).  See [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm after 30 straight minutes of over 90% memory utilization. | `object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })` | ```{ "create_alarm": true, "datapoints_to_alarm": 6, "evaluation_periods": 6, "period": 300, "statistic": "Maximum", "threshold": 90 }``` | no |
| ok\_actions | A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the OK state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic]). | `list(string)` | `[]` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| conntrack\_allowance\_exceeded | CloudWatch alarms that trigger when the connection tracking allowance is exceeded. |
| cpu\_utilization | CloudWatch alarms that monitor EC2 CPU utilization. |
| disk\_utilization | CloudWatch alarms that monitor EC2 disk utilization. |
| imdsv1\_request | CloudWatch alarms that trigger on EC2 IMDSv1 requests. |
| inbound\_bandwidth\_allowance\_exceeded | CloudWatch alarms that trigger when the inbound bandwidth allowance is exceeded. |
| instance\_status\_check | CloudWatch alarms that monitor EC2 instance status checks. |
| linklocal\_allowance\_exceeded | CloudWatch alarms that trigger when the linklocal packets-per-second allowance is exceeded.  This allowance impacts traffic to the DNS service, the Instance Metadata Service, and the Amazon Time Sync Service. |
| memory\_utilization | CloudWatch alarms that monitor EC2 memory utilization. |
| outbound\_bandwidth\_allowance\_exceeded | CloudWatch alarms that trigger when the outbound bandwidth allowance is exceeded. |
| pps\_allowance\_exceeded | CloudWatch alarms that trigger when the overall packets-per-second allowance is exceeded. |
| system\_status\_check | CloudWatch alarms that monitor EC2 system status checks. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
