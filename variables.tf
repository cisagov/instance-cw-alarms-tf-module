# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "instance_id" {
  description = "The ID of the AWS EC2 instance that is to be monitored (e.g. id-0123456789abcdef0)."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
variable "alarm_actions" {
  default     = []
  description = "A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the ALARM state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic])."
  nullable    = false
  type        = list(string)
}

variable "cpu_utilization_alarm_parameters" {
  default     = { create_alarm = true, datapoints_to_alarm = 6, evaluation_periods = 6, period = 300, statistic = "Maximum", threshold = 90.0 }
  description = "An object containing the parameters for the CPU utilization alarm (e.g. {create_alarm = true, datapoints_to_alarm = 6, evaluation_periods = 6, period = 300, statistic = \"Maximum\", threshold = 90.0}).  See the [Amazon CloudWatch documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm after 30 straight minutes of over 90% CPU utilization."
  nullable    = false
  type        = object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })
}

variable "create_cloudwatch_agent_alarms" {
  default     = true
  description = "A Boolean value indicating whether or not to create alarms based on CloudWatch metrics written by the CloudWatch Agent.  You will generally want this variable to be set to true; it should only be set to false for instances which are not running the CloudWatch Agent."
  nullable    = false
  type        = bool
}

variable "disk_utilization_alarm_parameters" {
  default     = { create_alarm = true, datapoints_to_alarm = 1, evaluation_periods = 1, period = 300, statistic = "Maximum", threshold = 90.0 }
  description = "An object containing the parameters for the disk utilization alarm (e.g. {create_alarm = true, datapoints_to_alarm = 1, evaluation_periods = 1, period = 60, statistic = \"Maximum\", threshold = 90.0}).  See the [Amazon CloudWatch documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm for greater than 90% disk utilization."
  nullable    = false
  type        = object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })
}

variable "insufficient_data_actions" {
  default     = []
  description = "A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the INSUFFICIENT_DATA state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic])."
  nullable    = false
  type        = list(string)
}

variable "memory_utilization_alarm_parameters" {
  default     = { create_alarm = true, datapoints_to_alarm = 6, evaluation_periods = 6, period = 300, statistic = "Maximum", threshold = 90.0 }
  description = "An object containing the parameters for the memory utilization alarm (e.g. {create_alarm = true, datapoints_to_alarm = 6, evaluation_periods = 6, period = 300, statistic = \"Maximum\", threshold = 90.0}).  See the [Amazon CloudWatch documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm after 30 straight minutes of over 90% memory utilization."
  nullable    = false
  type        = object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })
}

variable "ok_actions" {
  default     = []
  description = "A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the OK state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic])."
  nullable    = false
  type        = list(string)
}
