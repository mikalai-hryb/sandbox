variable "global_config" {
	type = "map"
}

variable "policy" {
	type = "string"
}

variable "env_config" {
	type = "map"
}


output "config" {
	value = "${merge(var.global_config, var.env_config)}"
}

output "policy" {
	value = "${var.policy}"
}