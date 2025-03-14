output "address_prefixes" {
  description = "The calculated address prefixes as CIDR ranges"
  value       = var.address_prefix_efficient_mode ? local.efficient_prefixes : local.inefficient_prefixes
}

output "address_prefixes_with_details" {
  description = "The calculated address prefixes as CIDR ranges with input details"
  value = {
    for key, value in var.address_prefixes :
    key => {
      cidr_range = var.address_prefix_efficient_mode ? local.efficient_prefixes[key] : local.inefficient_prefixes[key]
      size       = value
    }
  }
}
