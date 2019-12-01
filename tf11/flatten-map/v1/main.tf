variable "bucket" {
  description = "AWS S3 bucket name"
  type    = "string"
  default = ""
}

variable "key" {
  description = "a key to the JSON file"
  type    = "string"
}

variable "sort_keys" {
  description = "sort or not keys in the flatten map"
  default = "false"
}

data "external" "config" {
  program = ["python3", "${path.module}/flatten_json.py"]

  query = {
    bucket          = "${var.bucket}"
    key             = "${var.key}"
    sort_keys       = "${var.sort_keys}"
  }
}

output "value" {
  value = "${data.external.config.result}"
}
