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

variable "insufficient_data_actions" {
  type        = list(string)
  description = "A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the INSUFFICIENT_DATA state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic])."
  default     = []
}

variable "ok_actions" {
  type        = list(string)
  description = "A list of AWS ARNs corresponding to actions to be taken when a CloudWatch alarm transitions to the OK state from any other state (e.g. [arn:aws:sns:us-east-1:111122223333:my-topic])."
  default     = []
}
