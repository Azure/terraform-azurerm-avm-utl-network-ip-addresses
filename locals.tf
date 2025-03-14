locals {
  address_space_size  = tonumber(local.address_space_split[1])
  address_space_split = split("/", var.address_space)
}

locals {
  efficient_prefix_cidr_ranges   = cidrsubnets(var.address_space, local.efficient_prefix_new_bits...)
  efficient_prefix_keys          = keys(local.efficient_prefix_order_by_size)
  efficient_prefix_new_bits      = [for size in values(local.efficient_prefix_order_by_size) : size - local.address_space_size]
  efficient_prefix_order_by_size = { for key, value in var.address_prefixes : "${format("%03s", value)}||${key}" => value }
}

locals {
  efficient_prefixes = { for key, value in local.efficient_prefix_order_by_size : split("||", key)[1] => local.efficient_prefix_cidr_ranges[index(local.efficient_prefix_keys, key)] }
}

locals {
  inefficient_prefix_cidr_ranges = cidrsubnets(var.address_space, local.inefficient_prefix_new_bits...)
  inefficient_prefix_keys        = keys(var.address_prefixes)
  inefficient_prefix_new_bits    = [for size in values(var.address_prefixes) : size - local.address_space_size]
}

locals {
  inefficient_prefixes = { for key, value in var.address_prefixes : key => local.inefficient_prefix_cidr_ranges[index(local.inefficient_prefix_keys, key)] }
}
