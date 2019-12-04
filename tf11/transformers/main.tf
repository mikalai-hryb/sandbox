provider "aws" {
  region = "us-west-1"
}

//variable "env" {
//  type = "string"
//  default = "test"
//}
//
//variable "role" {
//  type = "string"
//  default = "transformers"
//}
//
//locals {
//  name = "${var.env}-${var.role}"
//}
//
//resource "aws_sns_topic" "transformer" {
//  name = "${local.another_name}"
//}
//
//data "aws_sns_topic" "proship_topic" {
//  name = "stage-sdc-proship"
//}
//
//module "test_queue" {
//  source = "test_queue"
//
//  name = "bla-bla-test"
//  receive_wait_time_seconds = 20
//}
//
//output "transformer_topic_name" {
//  value = "${aws_sns_topic.transformer.arn}"
//}
//
//output "proship_topic_name" {
//  value = "${data.aws_sns_topic.proship_topic.arn}"
//}

//output "test_queue_name" {
//  value = "${module.test_queue.name}"
//}



