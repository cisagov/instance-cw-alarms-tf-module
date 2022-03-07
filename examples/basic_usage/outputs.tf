output "instance" {
  value       = aws_instance.mine
  description = "The EC2 instance."
}

output "topic" {
  value       = aws_sns_topic.alarm_updates
  description = "The SNS topic."
}

output "system_status_check" {
  value       = module.alarms.system_status_check
  description = "CloudWatch alarms that monitor EC2 system status checks."
}

output "instance_status_check" {
  value       = module.alarms.instance_status_check
  description = "CloudWatch alarms that monitor EC2 instance status checks."
}
