provider "aws" {
  # Our primary provider uses our terraform role
  assume_role {
    role_arn     = var.tf_role_arn
    session_name = "terraform-example"
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

#-------------------------------------------------------------------------------
# Create an EC2 instance.  Code taken from
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#basic-example-using-ami-lookup.
# -------------------------------------------------------------------------------
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "mine" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
}

#-------------------------------------------------------------------------------
# Create a SNS topic.  Code taken from https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic#example-usage.
# -------------------------------------------------------------------------------
resource "aws_sns_topic" "alarm_updates" {
  name = "my-topic"
}

#-------------------------------------------------------------------------------
# Configure the module.
#-------------------------------------------------------------------------------
module "alarms" {
  source = "../../"
  providers = {
    aws = aws
  }

  alarm_actions             = [aws_sns_topic.alarm_updates.arn]
  instance_ids              = [aws_instance.mine.id]
  insufficient_data_actions = [aws_sns_topic.alarm_updates.arn]
  ok_actions                = [aws_sns_topic.alarm_updates.arn]
}
