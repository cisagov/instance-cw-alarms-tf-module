output "cpu_utilization" {
  value       = aws_cloudwatch_metric_alarm.cpu_utilization
  description = "CloudWatch alarms that monitor EC2 CPU utilization."
}

output "disk_utilization" {
  value       = aws_cloudwatch_metric_alarm.disk_utilization
  description = "CloudWatch alarms that monitor EC2 disk utilization."
}

output "imdsv1_request" {
  value       = aws_cloudwatch_metric_alarm.imdsv1_request
  description = "CloudWatch alarms that trigger on EC2 IMDSv1 requests."
}

output "instance_status_check" {
  value       = aws_cloudwatch_metric_alarm.instance_status_check
  description = "CloudWatch alarms that monitor EC2 instance status checks."
}

output "memory_utilization" {
  value       = aws_cloudwatch_metric_alarm.memory_utilization
  description = "CloudWatch alarms that monitor EC2 memory utilization."
}

output "system_status_check" {
  value       = aws_cloudwatch_metric_alarm.system_status_check
  description = "CloudWatch alarms that monitor EC2 system status checks."
}
