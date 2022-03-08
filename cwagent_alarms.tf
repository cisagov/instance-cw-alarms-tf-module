# ------------------------------------------------------------------------------
# Create a set of standard CloudWatch alarms for an EC2 instance.
# ------------------------------------------------------------------------------

data "aws_instance" "instances" {
  for_each    = toset(var.instance_ids)
  instance_id = each.value
}

# Alarm if we have 30 straight minutes of over 90% memory utilization.
resource "aws_cloudwatch_metric_alarm" "memory_utilization" {
  for_each = toset(var.instance_ids)

  alarm_actions       = var.alarm_actions
  alarm_description   = "Monitor EC2 instance memory utilization"
  alarm_name          = "ec2_memory_utilization_${each.value}"
  comparison_operator = "GreaterThanThreshold"
  datapoints_to_alarm = 6
  dimensions = {
    ImageId      = data.aws_instance.instances[each.value].ami
    InstanceId   = each.value
    InstanceType = data.aws_instance.instances[each.value].instance_type
  }
  evaluation_periods        = 6
  insufficient_data_actions = var.insufficient_data_actions
  metric_name               = "mem_used_percent"
  namespace                 = "CWAgent"
  ok_actions                = var.ok_actions
  period                    = 300
  statistic                 = "Maximum"
  threshold                 = 90.0
}
