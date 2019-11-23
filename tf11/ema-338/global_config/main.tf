locals {
  global_config = "${module.global_config.value}"
  policy = <<EOF
{
  "Effect": "Allow",
  "Action": [
     "sns:Publish"
  ],
  "Resource": [
     "some_arn"
  ]
}
EOF

}

module "global_config" {
  source = "../../../../sdc/sdc-fulfillment-processor/tf/modules/flatten-map/v1"

  key = "${path.module}/config.json"
  
}

output "last_name" {
  value = "${local.global_config["lastName"]}"
  sensitive = true
}

output "global_config" {
  value = "${local.global_config}"
  sensitive = true
}

output "policy" {
  value = "${local.policy}"
}