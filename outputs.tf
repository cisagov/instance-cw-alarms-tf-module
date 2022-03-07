output "system_status_check" {
  value       = aws_cloudwatch_metric_alarm.system_status_check
  description = "CloudWatch alarms that monitor EC2 system status checks."
}

output "instance_status_check" {
  value       = aws_cloudwatch_metric_alarm.instance_status_check
  description = "CloudWatch alarms that monitor EC2 instance status checks."
}
