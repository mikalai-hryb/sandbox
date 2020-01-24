variable "sns_arns" {
  type = "map"
}

variable "sns_counts" {
  type = "map"
}

variable "sqs_arn" {}

variable "sqs_url" {}

variable "sqs_region" {
  default = "us-west-1"
}

provider "aws" {
  region = "${var.sqs_region}"
  alias  = "sqs_provider"
}

resource "random_string" "policy-id" {
  length = 10
}

resource "aws_sqs_queue_policy" "allow-topic" {
  provider  = "aws.sqs_provider"
  queue_url = "${var.sqs_url}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "SQS:SendMessage",
      "Resource": "${var.sqs_arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [${join(",", formatlist("\"%s\"", split(",", join(",", flatten(values(var.sns_arns))))))}]
        }
      }
    }
  ]
}
EOF
}

module "us-west-1" {
  source = "subscription"

  sns_region = "us-west-1"
  sns_arns   = "${split(",", lookup(var.sns_arns, "us-west-1", ""))}"
  sns_count  = "${lookup(var.sns_counts, "us-west-1", "0")}"
  sqs_arn    = "${var.sqs_arn}"
}

module "us-west-2" {
  source = "subscription"

  sns_region = "us-west-2"
  sns_arns   = "${split(",", lookup(var.sns_arns, "us-west-2", ""))}"
  sns_count  = "${lookup(var.sns_counts, "us-west-2", "0")}"
  sqs_arn    = "${var.sqs_arn}"
}

module "us-east-1" {
  source = "subscription"

  sns_region = "us-east-1"
  sns_arns   = "${split(",", lookup(var.sns_arns, "us-east-1", ""))}"
  sns_count  = "${lookup(var.sns_counts, "us-east-1", "0")}"
  sqs_arn    = "${var.sqs_arn}"
}

module "us-east-2" {
  source = "subscription"

  sns_region = "us-east-2"
  sns_arns   = "${split(",", lookup(var.sns_arns, "us-east-2", ""))}"
  sns_count  = "${lookup(var.sns_counts, "us-east-2", "0")}"
  sqs_arn    = "${var.sqs_arn}"
}

//resource "aws_sns_topic_subscription" "subscription-us-west-1" {
//  count = "${lookup(var.sns_counts, "us-west-1", "0")}"
//
//  topic_arn            = "${element(split(",", lookup(var.sns_arns, "us-west-1", "")), count.index)}"
//  protocol             = "sqs"
//  endpoint             = "${var.sqs_arn}"
//  raw_message_delivery = true
//}
//
//resource "aws_sns_topic_subscription" "subscription-us-west-2" {
//  count = "${lookup(var.sns_counts, "us-west-2", "0")}"
//
//  topic_arn            = "${element(split(",", lookup(var.sns_arns, "us-west-2", "")), count.index)}"
//  protocol             = "sqs"
//  endpoint             = "${var.sqs_arn}"
//  raw_message_delivery = true
//}
//
//resource "aws_sns_topic_subscription" "subscription-us-east-1" {
//  count = "${lookup(var.sns_counts, "us-east-1", "0")}"
//
//  topic_arn            = "${element(split(",", lookup(var.sns_arns, "us-east-1", "")), count.index)}"
//  protocol             = "sqs"
//  endpoint             = "${var.sqs_arn}"
//  raw_message_delivery = true
//}
//
//resource "aws_sns_topic_subscription" "subscription-us-east-2" {
//  count = "${lookup(var.sns_counts, "us-east-2", "0")}"
//
//  topic_arn            = "${element(split(",", lookup(var.sns_arns, "us-east-2", "")), count.index)}"
//  protocol             = "sqs"
//  endpoint             = "${var.sqs_arn}"
//  raw_message_delivery = true
//}
