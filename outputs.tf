output "conntrack_allowance_exceeded" {
  value       = aws_cloudwatch_metric_alarm.conntrack_allowance_exceeded
  description = "CloudWatch alarms that trigger when the connection tracking allowance is exceeded."
}

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

output "inbound_bandwidth_allowance_exceeded" {
  value       = aws_cloudwatch_metric_alarm.bw_in_allowance_exceeded
  description = "CloudWatch alarms that trigger when the inbound bandwidth allowance is exceeded."
}

output "instance_status_check" {
  value       = aws_cloudwatch_metric_alarm.instance_status_check
  description = "CloudWatch alarms that monitor EC2 instance status checks."
}

output "linklocal_allowance_exceeded" {
  value       = aws_cloudwatch_metric_alarm.linklocal_allowance_exceeded
  description = "CloudWatch alarms that trigger when the linklocal packets-per-second allowance is exceeded.  This allowance impacts traffic to the DNS service, the Instance Metadata Service, and the Amazon Time Sync Service."
}

output "memory_utilization" {
  value       = aws_cloudwatch_metric_alarm.memory_utilization
  description = "CloudWatch alarms that monitor EC2 memory utilization."
}

output "outbound_bandwidth_allowance_exceeded" {
  value       = aws_cloudwatch_metric_alarm.bw_out_allowance_exceeded
  description = "CloudWatch alarms that trigger when the outbound bandwidth allowance is exceeded."
}

output "pps_allowance_exceeded" {
  value       = aws_cloudwatch_metric_alarm.pps_allowance_exceeded
  description = "CloudWatch alarms that trigger when the overall packets-per-second allowance is exceeded."
}

output "system_status_check" {
  value       = aws_cloudwatch_metric_alarm.system_status_check
  description = "CloudWatch alarms that monitor EC2 system status checks."
}
