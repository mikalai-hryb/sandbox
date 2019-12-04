provider "aws" {
  region = "us-west-1"
}

//variable "receive_wait_time_seconds" {
//  default = 10
//}
//
//variable "name" {
//  default = "transformers-test-queue"
//}
//
//resource "aws_sqs_queue" "terraform_queue" {
//  name                      = "${var.name}"
//  delay_seconds             = 90
//  max_message_size          = 2048
//  message_retention_seconds = 86400
//  receive_wait_time_seconds = "${var.receive_wait_time_seconds}"
//}
//
//output "name" {
//  value = "${aws_sqs_queue.terraform_queue.name}"
//}
