provider "aws" {
  region = "us-west-1"
}

locals {
  env                           = "qa1"
  domain                        = "fulfillment-processing"
  tracking_table_read_capacity  = 1
  tracking_table_write_capacity = 5
}

module "tracking_table" {
  source      = "git@github.com:CamelotVG/sdc-terraform-modules//dynamo/v1"

  environment = "${local.env}"
  domain      = "${local.domain}"
  table       = "fulfillment-events"

  read_capacity   = "${local.tracking_table_read_capacity}"
  write_capacity  = "${local.tracking_table_write_capacity}"

  hash_key    = "tracking_id"
  range_key   = "event_date_ts"
  attributes  = [
    {
      name = "tracking_id"
      type = "S"
    },
    {
      name = "event_date_ts"
      type = "N"
    }
  ]
}

//TERRAFORM = "prod/fulfillment-processing"
