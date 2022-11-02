variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "workstation_name" {
  description = "Name of the workstation"
  default     = "workstation"
}

locals {
  vpc_name                             = join("-", [var.workstation_name, "vpc"])
  security_group_name                  = join("-", [var.workstation_name, "sg"])
  instance_name                        = join("-", [var.workstation_name, "ec2"])
  instance_role_name                   = join("-", [var.workstation_name, "role"])
  instance_role_policy_attachment_name = join("-", [var.workstation_name, "pa"])
  instance_profile_name                = join("-", [var.workstation_name, "ip"])
}
