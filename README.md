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
| [aws_cloudwatch_metric_alarm.instance_status_check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.system_status_check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_actions | A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the ALARM state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic]). | `list(string)` | `[]` | no |
| instance\_ids | A list of AWS EC2 instance IDs that are to be monitored (e.g. [id-0123456789abcdef0, id-0123456789abcdef1]). | `list(string)` | n/a | yes |
| insufficient\_data\_actions | A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the INSUFFICIENT\_DATA state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic]). | `list(string)` | `[]` | no |
| ok\_actions | A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the OK state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic]). | `list(string)` | `[]` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| instance\_status\_check | CloudWatch alarms that monitor EC2 instance status checks. |
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
