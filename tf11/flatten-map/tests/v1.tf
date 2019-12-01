locals {
  flatten_config = "${module.flatten_config.value}"
}

module "flatten_config" {
  source = "../v1"

  key       = "config.json"
  sort_keys = "true"
}

output "scenarios" {
  value = "${map(
    "flatten_map_exist",
    local.flatten_config["starSystem"] == "Solar System",

    "string_key_exists",
    local.flatten_config["planets__0__name"] == "Mercury",

    "number_key_exists",
    local.flatten_config["planets__0__satelliteCount"] == "0",

    "nested_map_key_exits",
    local.flatten_config["planets__0__neighbouringPlanets__0"] == "Venus"
  )}"
}
