provider "aws" {
  region = "us-west-1"
}

module "sns1" {
  source = "../../sns-topic/v1"

  environment = "test"
  domain      = "sns-subscribe-sqs"
  role        = "test1"
}

module "sns2" {
  source = "../../sns-topic/v1"

  environment = "test"
  domain      = "sns-subscribe-sqs"
  role        = "test2"
}

module "sqs" {
  source = "../../sqs-queue/v1"

  environment = "test"
  domain      = "sns-subscribe-sqs"
  role        = "test"
}

module "subscriptions" {
  source = "../v1"

  sns_arns = {
    us-west-1 = "${module.sns1.arn},${module.sns2.arn}"
  }

  sns_counts = {
    us-west-1 = 2
  }

  sqs_arn = "${module.sqs.arn}"
  sqs_url = "${module.sqs.url}"
}

provider "aws" {
  region = "us-west-2"
  alias  = "us-west-2"
}

resource "aws_sqs_queue" "queue-us-west-2" {
  provider = "aws.us-west-2"

  name = "test-sns-subscribe-sqs-cross-region"

  tags = {
    TERRAFORMED = "test/sns-subscribe-sqs"
  }
}

provider "aws" {
  region = "us-east-2"
  alias  = "us-east-2"
}

resource "aws_sns_topic" "topic-us-east-2" {
  provider = "aws.us-east-2"

  name = "test-sns-sqs-subscriptions-cross-region"
}

module "cross-region-1" {
  source = "../v1"

  sns_arns = {
    us-west-1 = "${module.sns1.arn},${module.sns2.arn}"
    us-east-2 = "${aws_sns_topic.topic-us-east-2.arn}"
  }

  sns_counts = {
    us-west-1 = 2
    us-east-2 = 1
  }

  sqs_arn    = "${aws_sqs_queue.queue-us-west-2.arn}"
  sqs_url    = "${aws_sqs_queue.queue-us-west-2.id}"
  sqs_region = "us-west-2"
}
