provider "aws" {
  region = "us-west-1"
}

variable "global_config" {
  type = "map"
  default = {}
}

variable "policy" {
  type = "string"
  default = {}
}

variable "env_config" {
  type = "map"
}

locals {
  env = "qa1"
  redis_cluster_name_secret_name    = "${local.env}/shared/redis-cluster-name"
  tesseract_instance_id_secret_name = "${local.env == "prod"
    ? "prod/shared/tesseract/instance-identifier-read"
    : format("%s%s", local.env, "/shared/tesseract/instance-identifier")
  }"

  redis_host     = "${data.aws_elasticache_replication_group.redis_node.primary_endpoint_address}"
}

# Redis
data "aws_secretsmanager_secret" "redis_cluster_name_secret" {
  name = "${local.redis_cluster_name_secret_name}"
}

data "aws_secretsmanager_secret_version" "redis_cluster_name" {
  secret_id = "${data.aws_secretsmanager_secret.redis_cluster_name_secret.id}"
}

data "aws_elasticache_replication_group" "redis_node" {
  replication_group_id = "${data.aws_secretsmanager_secret_version.redis_cluster_name.secret_string}"
}


output "config" {
	value = "${merge(var.global_config, var.env_config)}"
}

output "policy" {
	value = "${var.policy}"
}

output "s_policy" {
	value = "${data.aws_secretsmanager_secret.redis_cluster_name_secret.policy}"
}