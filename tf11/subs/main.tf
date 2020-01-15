variable "env" {
  default = "qa1"
}

provider "aws" {
  region = "us-west-1"
}

locals {
  env = "${var.env}"
}

# TODO: move vulcal inbox subscrition to the Vulcal when Terraform is ready
data aws_sns_topic "fulfillment_topic" {
  name = "${local.env}-fulfillment-processing-fulfillment-events"
}

data "aws_sqs_queue" "vulcan_inbox" {
  name = "${local.env}-vulcan-inbox"
}

data "aws_sqs_queue" "inbox" {
  name = "${local.env}-fulfillment-processing-inbox"
}

resource "aws_sns_topic_subscription" "fulfillment_topic_vulcan_inbox_subscription" {
  topic_arn            = "${data.aws_sns_topic.fulfillment_topic.arn}"
  protocol             = "sqs"
  endpoint             = "${data.aws_sqs_queue.vulcan_inbox.arn}"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "fulfillment_topic_inbox_subscription" {
  topic_arn            = "${data.aws_sns_topic.fulfillment_topic.arn}"
  protocol             = "sqs"
  endpoint             = "${data.aws_sqs_queue.inbox.arn}"
  raw_message_delivery = true
}
