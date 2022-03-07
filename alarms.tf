# ------------------------------------------------------------------------------
# Create a set of standard CloudWatch alarms for an EC2 instance.
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_metric_alarm" "system_status_check" {
  for_each = toset(var.instance_ids)

  alarm_actions       = var.alarm_actions
  alarm_description   = "Monitor EC2 system status check"
  alarm_name          = "ec2_system_status_check_${each.value}"
  comparison_operator = "GreaterThanThreshold"
  dimensions = {
    InstanceId = each.value
  }
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_name               = "StatusCheckFailed_System"
  namespace                 = "AWS/EC2"
  ok_actions                = var.ok_actions
  # This is the minimum value for alarms in the AWS namespace.
  period    = 60
  statistic = "Maximum"
  threshold = 0
}

resource "aws_cloudwatch_metric_alarm" "instance_status_check" {
  for_each = toset(var.instance_ids)

  alarm_actions       = var.alarm_actions
  alarm_description   = "Monitor EC2 instance status check"
  alarm_name          = "ec2_instance_status_check_${each.value}"
  comparison_operator = "GreaterThanThreshold"
  dimensions = {
    InstanceId = each.value
  }
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_name               = "StatusCheckFailed_Instance"
  namespace                 = "AWS/EC2"
  ok_actions                = var.ok_actions
  # This is the minimum value for alarms in the AWS namespace.
  period    = 60
  statistic = "Maximum"
  threshold = 0
}
