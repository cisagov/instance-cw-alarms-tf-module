# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "tf_role_arn" {
  description = "The ARN of the role that can terraform non-specialized resources."
  type        = string
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  type        = string
}

variable "tags" {
  default = {
    Testing = true
  }
  description = "Tags to apply to all AWS resources created."
  type        = map(string)
}
