


# This is the module call
module "efficient_address_prefixes_ordered" {
  source = "../../"

  address_prefixes = var.address_prefixes_ordered
  address_space    = var.address_space
  enable_telemetry = var.enable_telemetry
}

module "inefficient_address_prefixes_ordered" {
  source = "../../"

  address_prefixes              = var.address_prefixes_ordered
  address_space                 = var.address_space
  address_prefix_efficient_mode = false
  enable_telemetry              = var.enable_telemetry
}

module "efficient_address_prefixes_unordered" {
  source = "../../"

  address_prefixes = var.address_prefixes_unordered
  address_space    = var.address_space
  enable_telemetry = var.enable_telemetry
}

module "inefficient_address_prefixes_unordered" {
  source = "../../"

  address_prefixes              = var.address_prefixes_unordered
  address_space                 = var.address_space
  address_prefix_efficient_mode = false
  enable_telemetry              = var.enable_telemetry
}








