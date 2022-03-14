# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "instance_ids" {
  type        = list(string)
  description = "A list of AWS EC2 instance IDs that are to be monitored (e.g. [id-0123456789abcdef0, id-0123456789abcdef1])."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
variable "alarm_actions" {
  type        = list(string)
  description = "A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the ALARM state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic])."
  default     = []
}

variable "cpu_utilization_alarm_parameters" {
  type        = object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })
  description = "An object containing the parameters for the CPU utilization alarm (e.g. {create_alarm = true, datapoints_to_alarm = 6, evaluation_periods = 6, period = 300, statistic = \"Maximum\", threshold = 90.0}).  See [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm after 30 straight minutes of over 90% CPU utilization."
  default     = { create_alarm = true, datapoints_to_alarm = 6, evaluation_periods = 6, period = 300, statistic = "Maximum", threshold = 90.0 }
}

variable "disk_utilization_alarm_parameters" {
  type        = object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })
  description = "An object containing the parameters for the disk utilization alarm (e.g. {create_alarm = true, datapoints_to_alarm = 1, evaluation_periods = 1, period = 60, statistic = \"Maximum\", threshold = 90.0}).  See [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm for greater then 90% disk utilization."
  default     = { create_alarm = true, datapoints_to_alarm = 1, evaluation_periods = 1, period = 300, statistic = "Maximum", threshold = 90.0 }
}

variable "insufficient_data_actions" {
  type        = list(string)
  description = "A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the INSUFFICIENT_DATA state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic])."
  default     = []
}

variable "memory_utilization_alarm_parameters" {
  type        = object({ create_alarm = bool, datapoints_to_alarm = number, evaluation_periods = number, period = number, statistic = string, threshold = number })
  description = "An object containing the parameters for the memory utilization alarm (e.g. {create_alarm = true, datapoints_to_alarm = 6, evaluation_periods = 6, period = 300, statistic = \"Maximum\", threshold = 90.0}).  See [here](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html) for an explanation of the parameters.  The default is to alarm after 30 straight minutes of over 90% memory utilization."
  default     = { create_alarm = true, datapoints_to_alarm = 6, evaluation_periods = 6, period = 300, statistic = "Maximum", threshold = 90.0 }
}

variable "ok_actions" {
  type        = list(string)
  description = "A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the OK state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic])."
  default     = []
}
