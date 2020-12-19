provider "aws" {
  region = "us-west-1"
  profile = "smiledirectclub:Developer"

}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

output "region_name" {
  value = "${data.aws_region.current.name}"
}

output "user_id" {
  value = "${data.aws_caller_identity.current.user_id}"
}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "arn" {
  value = "${data.aws_caller_identity.current.arn}"
}

output "id" {
  value = "${data.aws_caller_identity.current.id}"
}

data "aws_s3_bucket" "configuration_bucket" {
  bucket = "sdc-configuration"
}

data "aws_s3_bucket_object" "config" {
  bucket = "${data.aws_s3_bucket.configuration_bucket.id}"
  key    = "sdc_tracking_service/qa1/config.json"
}

output "the_content" {
  value = "${jsondecode(data.aws_s3_bucket_object.config.body)["aws"]["lambda"]["get_tracking_data"]["auth_key"]}"
}