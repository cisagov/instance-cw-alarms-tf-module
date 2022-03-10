# ------------------------------------------------------------------------------
# Create a set of standard CloudWatch alarms for an EC2 instance.
# ------------------------------------------------------------------------------

# Alarm if we have 30 straight minutes of over 90% memory utilization.
resource "aws_cloudwatch_metric_alarm" "memory_utilization" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance memory utilization"
  alarm_name                = "ec2_memory_utilization_${each.value}"
  comparison_operator       = "GreaterThanThreshold"
  datapoints_to_alarm       = 6
  evaluation_periods        = 6
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id = "memory_utilization"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "mem_used_percent"
      namespace   = "CWAgent"
      period      = 300
      stat        = "Maximum"
    }
    return_data = true
  }
  ok_actions = var.ok_actions
  threshold  = 90.0
}

# Alarm if any disks ever reach 90% utilization.
resource "aws_cloudwatch_metric_alarm" "disk_utilization" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance disk utilization"
  alarm_name                = "ec2_disk_utilization_${each.key}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id = "disk_utilization"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "disk_used_percent"
      namespace   = "CWAgent"
      period      = 300
      stat        = "Maximum"
    }
    return_data = true
  }
  ok_actions = var.ok_actions
  threshold  = 90.0
}
