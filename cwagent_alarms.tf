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

# Alarm if any packets are queued and/or dropped because the inbound
# aggregate bandwidth exceeded the maximum for the instance.
resource "aws_cloudwatch_metric_alarm" "bw_in_allowance_exceeded" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance inbound bandwidth allowance"
  alarm_name                = "bw_in_allowance_exceeded_${each.key}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id          = "bw_in_allowance_exceeded_rate"
    expression  = "RATE(bw_in_allowance_exceeded_count)"
    label       = "Inbound Bandwidth Allowance Exceeded Rate of Change"
    return_data = true
  }
  metric_query {
    id = "bw_in_allowance_exceeded_count"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "ethtool_bw_in_allowance_exceeded"
      namespace   = "CWAgent"
      period      = 60
      stat        = "Maximum"
    }
  }
  ok_actions = var.ok_actions
  threshold  = 0
}

# Alarm if any packets are queued and/or dropped because the outbound
# aggregate bandwidth exceeded the maximum for the instance.
resource "aws_cloudwatch_metric_alarm" "bw_out_allowance_exceeded" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance outbound bandwidth allowance"
  alarm_name                = "bw_out_allowance_exceeded_${each.key}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id          = "bw_out_allowance_exceeded_rate"
    expression  = "RATE(bw_out_allowance_exceeded_count)"
    label       = "Outbound Bandwidth Allowance Exceeded Rate of Change"
    return_data = true
  }
  metric_query {
    id = "bw_out_allowance_exceeded_count"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "ethtool_bw_out_allowance_exceeded"
      namespace   = "CWAgent"
      period      = 60
      stat        = "Maximum"
    }
  }
  ok_actions = var.ok_actions
  threshold  = 0
}

# Alarm if any packets are dropped because connection tracking
# exceeded the maximum for the instance and new connections could not
# be established.
resource "aws_cloudwatch_metric_alarm" "conntrack_allowance_exceeded" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance conntrack allowance"
  alarm_name                = "conntrack_allowance_exceeded_${each.key}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id          = "conntrack_allowance_exceeded_rate"
    expression  = "RATE(conntrack_allowance_exceeded_count)"
    label       = "Conntrack Allowance Exceeded Rate of Change"
    return_data = true
  }
  metric_query {
    id = "conntrack_allowance_exceeded_count"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "ethtool_conntrack_allowance_exceeded"
      namespace   = "CWAgent"
      period      = 60
      stat        = "Maximum"
    }
  }
  ok_actions = var.ok_actions
  threshold  = 0
}

# Alarm if any packets are dropped because the PPS of the traffic to
# local proxy services exceeded the maximum for the network
# interface. This impacts traffic to the DNS service, the Instance
# Metadata Service, and the Amazon Time Sync Service.
resource "aws_cloudwatch_metric_alarm" "linklocal_allowance_exceeded" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance linklocal allowance"
  alarm_name                = "linklocal_allowance_exceeded_${each.key}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id          = "linklocal_allowance_exceeded_rate"
    expression  = "RATE(linklocal_allowance_exceeded_count)"
    label       = "Linklocal Allowance Exceeded Rate of Change"
    return_data = true
  }
  metric_query {
    id = "linklocal_allowance_exceeded_count"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "ethtool_linklocal_allowance_exceeded"
      namespace   = "CWAgent"
      period      = 60
      stat        = "Maximum"
    }
  }
  ok_actions = var.ok_actions
  threshold  = 0
}

# Alarm each time any packets are queued and/or dropped because the
# bidirectional PPS exceeded the maximum for the instance.
resource "aws_cloudwatch_metric_alarm" "pps_allowance_exceeded" {
  for_each = toset(var.instance_ids)

  alarm_actions             = var.alarm_actions
  alarm_description         = "Monitor EC2 instance PPS allowance"
  alarm_name                = "pps_allowance_exceeded_${each.key}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  insufficient_data_actions = var.insufficient_data_actions
  metric_query {
    id          = "pps_allowance_exceeded_rate"
    expression  = "RATE(pps_allowance_exceeded_count)"
    label       = "PPS Allowance Exceeded Rate of Change"
    return_data = true
  }
  metric_query {
    id = "pps_allowance_exceeded_count"
    metric {
      dimensions = {
        InstanceId = each.value
      }
      metric_name = "ethtool_pps_allowance_exceeded"
      namespace   = "CWAgent"
      period      = 60
      stat        = "Maximum"
    }
  }
  ok_actions = var.ok_actions
  threshold  = 0
}
