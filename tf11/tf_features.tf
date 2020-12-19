provider "aws" {
  region = "us-east-2"
}

locals {
  default_tags = {
    TERRAFORM   = "1"
    Domain      = "2"
    Environment = "3"
    Tier = 0
  }
}

variable "default_tag" {
	default = "TERRAFORM"
}



variable "v1" {
	description = "describe your variable"
	default     = "Hello"
}

variable "v2" {
	default = "2"
}

variable "v3" {
	default = "3"
}

resource "random_password" "vessel_password" {
  length           = 16
  special          = true
  override_special = "/@\" "
}

output "test1" {
	value = "${7 / 2}"
}

output "test2" {
	value = "${var.v2 + var.v3}" # return int
}

output "vessel_password" {
	value = "${random_password.vessel_password.result}"
}

output "m" {
  value = "${merge(local.default_tags, map("Tier", "private"))}"
}

output "k" {
  value = "${local.default_tags}"
}

output "dt" {
  value = "${local.default_tags[var.default_tag]}"
}
