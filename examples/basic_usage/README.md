# Create Alarms for an Instance #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.1 |
| aws | ~> 4.9 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 4.9 |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| alarms | ../../ | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_instance.mine](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_sns_topic.alarm_updates](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | ```{ "Testing": true }``` | no |
| tf\_role\_arn | The ARN of the role that can terraform non-specialized resources. | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| conntrack\_allowance\_exceeded | A CloudWatch alarm that triggers when the connection tracking allowance is exceeded. |
| cpu\_utilization | A CloudWatch alarm that monitors EC2 CPU utilization. |
| disk\_utilization | A CloudWatch alarm that monitors EC2 disk utilization. |
| imdsv1\_request | A CloudWatch alarm that triggers on EC2 IMDSv1 requests. |
| inbound\_bandwidth\_allowance\_exceeded | A CloudWatch alarm that triggers when the inbound bandwidth allowance is exceeded. |
| instance | The EC2 instance. |
| instance\_status\_check | A CloudWatch alarm that monitors EC2 instance status checks. |
| linklocal\_allowance\_exceeded | A CloudWatch alarm that triggers when the linklocal packets-per-second allowance is exceeded.  This allowance impacts traffic to the DNS service, the Instance Metadata Service, and the Amazon Time Sync Service. |
| memory\_utilization | A CloudWatch alarm that monitors EC2 memory utilization. |
| outbound\_bandwidth\_allowance\_exceeded | A CloudWatch alarm that triggers when the outbound bandwidth allowance is exceeded. |
| pps\_allowance\_exceeded | A CloudWatch alarm that triggers when the overall packets-per-second allowance is exceeded. |
| system\_status\_check | A CloudWatch alarm that monitors EC2 system status checks. |
| topic | The SNS topic. |
<!-- END_TF_DOCS -->
