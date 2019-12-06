provider "aws" {
  region = "us-west-1"
}

resource "aws_sns_topic" "alerts_topic" {
  name = "awesome-alerts-topic"
}

module "test_queue" {
  source = "perfect_queue"

  env       = "super-production"
  name      = "tranformers"
  topic_arn = "${aws_sns_topic.alerts_topic.arn}"
}

output "test_queue_name" {
  value = "${module.test_queue.arn}"
}



