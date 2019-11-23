locals {
	env_config = "${module.env_config.value}"
}

module "env_config" {
	source = "../../../../sdc/sdc-fulfillment-processor/tf/modules/flatten-map/v1"

	key = "${path.module}/config.json"
	
}

output "last_name" {
	value = "${local.env_config["lastName"]}"
}

output "env_config" {
	value = "${local.env_config}"
}