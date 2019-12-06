provider "aws" {
  region = "us-west-1"
}


variable "env" {
  type = "string"
}

variable "name" {
  default = "mikalai_hryb"
}


//locals {
//  full_name = "${var.env}-${var.name}-test"
//}
//
//
//resource "aws_sqs_queue" "perfect_queue" {
//  name                      = "${local.full_name}"
//  delay_seconds             = 90
//  max_message_size          = 2048
//  message_retention_seconds = 86400
//  receive_wait_time_seconds = 10
//}
//
//data "aws_sqs_queue" "inbox_queue" {
//  name = "qa1-fulfillment-inbox"
//}
//
//
//output "arn" {
//  value = "${aws_sqs_queue.perfect_queue.arn}"
//}
//
//output "fulfillment_inbox_arn" {
//  value = "${data.aws_sqs_queue.inbox_queue.arn}"
//}






//variable "topic_arn" {
//  type = "string"
//}


//resource "aws_sqs_queue_policy" "test" {
//  queue_url = "${aws_sqs_queue.transformers_queue.id}"
//
//  policy = <<POLICY
//{
//  "Version": "2012-10-17",
//  "Id": "sqspolicy",
//  "Statement": [
//    {
//      "Sid": "First",
//      "Effect": "Allow",
//      "Principal": "*",
//      "Action": "sqs:SendMessage",
//      "Resource": "${aws_sqs_queue.transformers_queue.arn}",
//      "Condition": {
//        "ArnEquals": {
//          "aws:SourceArn": "${var.topic_arn}"
//        }
//      }
//    }
//  ]
//}
//POLICY
//}
