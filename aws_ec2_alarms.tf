# ------------------------------------------------------------------------------
# Create a set of standard CloudWatch alarms for an EC2 instance.
# These alarms are based on the "automatic" metrics that come from the
# AWS EC2 managed service (i.e., from the AWS/EC2 metric namespace).
# ------------------------------------------------------------------------------

# Alarm if a system status check ever fails.
resource "aws_cloudwatch_metric_alarm" "system_status_check" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 system status check"
  alarm_name                = "ec2_system_status_check_${each.value}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id = "system_status_check"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "StatusCheckFailed_System"
      namespace   = "AWS/EC2"
      period      = 60
      stat        = "Maximum"
    }
    return_data = true
  }
  ok_actions = var.ok_actions
  threshold  = 0
}

# Alarm if an instance status check ever fails.
resource "aws_cloudwatch_metric_alarm" "instance_status_check" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance status check"
  alarm_name                = "ec2_instance_status_check_${each.value}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id = "instance_status_check"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "StatusCheckFailed_Instance"
      namespace   = "AWS/EC2"
      period      = 60
      stat        = "Maximum"
    }
    return_data = true
  }
  ok_actions = var.ok_actions
  threshold  = 0
}

# Alarm if an IMDSv1 request ever succeeds.
#
# This alarm should never go off if all instances are correctly
# configured to use IMDSv2 only.
resource "aws_cloudwatch_metric_alarm" "imdsv1_request" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance MetadataNoToken metric"
  alarm_name                = "ec2_metadata_no_token_${each.value}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id = "imdsv1_request"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "MetadataNoToken"
      namespace   = "AWS/EC2"
      period      = 300
      stat        = "Maximum"
    }
    return_data = true
  }
  ok_actions = var.ok_actions
  threshold  = 0
}

# Alarm for CPU utilization
resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  for_each = var.cpu_utilization_alarm_parameters.create_alarm ? toset(var.instance_ids) : toset([])

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance CPU utilization"
  alarm_name                = "ec2_cpu_utilization_${each.value}"
  comparison_operator       = "GreaterThanThreshold"
  datapoints_to_alarm       = var.cpu_utilization_alarm_parameters.datapoints_to_alarm
  evaluation_periods        = var.cpu_utilization_alarm_parameters.evaluation_periods
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id = "cpu_utilization"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "CPUUtilization"
      namespace   = "AWS/EC2"
      period      = var.cpu_utilization_alarm_parameters.period
      stat        = var.cpu_utilization_alarm_parameters.statistic
    }
    return_data = true
  }
  ok_actions = var.ok_actions
  threshold  = var.cpu_utilization_alarm_parameters.threshold
}