# This is the module call
module "efficient_address_prefixes_ordered" {
  source = "../../"

  address_prefixes = var.address_prefixes_ordered
  address_space    = var.address_space
}

module "inefficient_address_prefixes_ordered" {
  source = "../../"

  address_prefixes              = var.address_prefixes_ordered
  address_space                 = var.address_space
  address_prefix_efficient_mode = false
}

module "efficient_address_prefixes_unordered" {
  source = "../../"

  address_prefixes = var.address_prefixes_unordered
  address_space    = var.address_space
}

module "inefficient_address_prefixes_unordered" {
  source = "../../"

  address_prefixes              = var.address_prefixes_unordered
  address_space                 = var.address_space
  address_prefix_efficient_mode = false
}
