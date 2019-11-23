variable "v1" {
	description = "describe your variable"
	default     = "Hello"
}

variable "v2" {
	default = "2"
}

variable "v3" {
	default = "3"
}


output "test1" {
	value = "${7 / 2}"
}

output "test2" {
	value = "${var.v2 + var.v3}" # return int
}

