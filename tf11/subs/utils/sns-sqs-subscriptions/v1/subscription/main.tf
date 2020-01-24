variable "sns_region" {}

variable "sns_arns" {
  type = "list"
}

variable "sns_count" {}

variable "sqs_arn" {}

provider "aws" {
  region = "${var.sns_region}"
}

resource "aws_sns_topic_subscription" "subscription" {
  count = "${var.sns_count}"

  topic_arn            = "${element(var.sns_arns, count.index)}"
  protocol             = "sqs"
  endpoint             = "${var.sqs_arn}"
  raw_message_delivery = true
}
