output "cpu_utilization" {
  value       = module.alarms.cpu_utilization
  description = "CloudWatch alarms that monitor EC2 CPU utilization."
}

output "imdsv1_request" {
  value       = module.alarms.imdsv1_request
  description = "CloudWatch alarms that trigger on EC2 IMDSv1 requests."
}

output "instance" {
  value       = aws_instance.mine
  description = "The EC2 instance."
}

output "instance_status_check" {
  value       = module.alarms.instance_status_check
  description = "CloudWatch alarms that monitor EC2 instance status checks."
}

output "system_status_check" {
  value       = module.alarms.system_status_check
  description = "CloudWatch alarms that monitor EC2 system status checks."
}

output "topic" {
  value       = aws_sns_topic.alarm_updates
  description = "The SNS topic."
}
