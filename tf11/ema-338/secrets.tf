locals {
  arn = "arn:aws:secretsmanager:us-west-1:866893681515:secret:qa1/fulfillment-processing/private/application-settings-bCtJUP"
  name = "${element(split(":", local.arn), 6)}"
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = "${local.name}"
}

output "value" {
  value = "${data.aws_secretsmanager_secret_version.secret.secret_string}"
}