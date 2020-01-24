provider "aws" {
  region = "us-west-1"
}

locals {
  env    = "mikalai"
  domain = "hryb"
  topic_arns = [
    "${module.aftership_topic.arn}",
    "${module.fulfillment_topic.arn}",
  ]
  sns_arns = {
    us-west-1 = "${join(",", local.topic_arns)}"
  }
  sns_counts = {
//    us-west-1 = "${length(local.topic_arns)}"
    us-west-1 = 3
  }
}

module "aftership_topic" {
  source = "git@github.com:CamelotVG/sdc-terraform-modules//sns-topic/v1"

  environment = "${local.env}"
  domain      = "${local.domain}"
  role        = "aftership-events"
}

module "fulfillment_topic" {
  source = "git@github.com:CamelotVG/sdc-terraform-modules//sns-topic/v1"

  environment = "${local.env}"
  domain      = "${local.domain}"
  role        = "fulfillment-events"
}

module "inbox_queue" {
  source = "git@github.com:CamelotVG/sdc-terraform-modules//sqs-queue/v3"

  environment = "${local.env}"
  domain      = "${local.domain}"
  role        = "inbox"

  fifo_queue                  = "false"
  visibility_timeout_seconds  = 30
  message_retention_seconds   = 1440
}

//module "subscriptions" {
//  source = "./utils/sns-sqs-subscriptions/v1"
//
//  sqs_arn = "${module.inbox_queue.arn}"
//  sqs_url = "${module.inbox_queue.url}"
//
//  sns_arns    = "${local.sns_arns}"
//  sns_counts  = "${local.sns_counts}"
//}



//module "tracking_table" {
//  source      = "git@github.com:CamelotVG/sdc-terraform-modules//dynamo/v1"
//
//  environment = "qa1"
//  domain      = "fulfillment-processing"
//  table       = "fulfillment-events"
//
//  read_capacity   = 1
//  write_capacity  = 5
//
//  hash_key    = "tracking_id"
//  range_key   = "event_date_ts"
//  attributes  = [
//    {
//      name = "tracking_id"
//      type = "S"
//    },
//    {
//      name = "event_date_ts"
//      type = "N"
//    }
//  ]
//}


