output "conntrack_allowance_exceeded" {
  value       = module.alarms.conntrack_allowance_exceeded
  description = "CloudWatch alarms that trigger when the connection tracking allowance is exceeded."
}

output "cpu_utilization" {
  value       = module.alarms.cpu_utilization
  description = "CloudWatch alarms that monitor EC2 CPU utilization."
}

output "disk_utilization" {
  value       = module.alarms.disk_utilization
  description = "CloudWatch alarms that monitor EC2 disk utilization."
}

output "imdsv1_request" {
  value       = module.alarms.imdsv1_request
  description = "CloudWatch alarms that trigger on EC2 IMDSv1 requests."
}

output "inbound_bandwidth_allowance_exceeded" {
  value       = module.alarms.inbound_bandwidth_allowance_exceeded
  description = "CloudWatch alarms that trigger when the inbound bandwidth allowance is exceeded."
}

output "instance" {
  value       = aws_instance.mine
  description = "The EC2 instance."
}

output "instance_status_check" {
  value       = module.alarms.instance_status_check
  description = "CloudWatch alarms that monitor EC2 instance status checks."
}

output "linklocal_allowance_exceeded" {
  value       = module.alarms.linklocal_allowance_exceeded
  description = "CloudWatch alarms that trigger when the linklocal packets-per-second allowance is exceeded.  This allowance impacts traffic to the DNS service, the Instance Metadata Service, and the Amazon Time Sync Service."
}

output "memory_utilization" {
  value       = module.alarms.memory_utilization
  description = "CloudWatch alarms that monitor EC2 memory utilization."
}

output "outbound_bandwidth_allowance_exceeded" {
  value       = module.alarms.outbound_bandwidth_allowance_exceeded
  description = "CloudWatch alarms that trigger when the outbound bandwidth allowance is exceeded."
}

output "pps_allowance_exceeded" {
  value       = module.alarms.pps_allowance_exceeded
  description = "CloudWatch alarms that trigger when the overall packets-per-second allowance is exceeded."
}

output "system_status_check" {
  value       = module.alarms.system_status_check
  description = "CloudWatch alarms that monitor EC2 system status checks."
}

output "topic" {
  value       = aws_sns_topic.alarm_updates
  description = "The SNS topic."
}
