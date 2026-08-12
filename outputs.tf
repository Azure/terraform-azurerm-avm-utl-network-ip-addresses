output "address_prefixes" {
  description = "The calculated address prefixes as CIDR ranges"
  value       = var.address_prefix_efficient_mode ? local.efficient_prefixes : local.inefficient_prefixes
}

output "address_prefixes_with_details" {
  description = "The calculated address prefixes as CIDR ranges with input details"
  value = {
    for key, value in local.final_address_prefixes :
    key => {
      cidr_range             = var.address_prefix_efficient_mode ? local.efficient_prefixes[key] : local.inefficient_prefixes[key]
      cidr_prefix_size       = value
      requested_ip_addresses = var.number_of_ip_addresses != null ? var.number_of_ip_addresses[key] : null
      actual_ip_addresses    = pow(2, 32 - value)
      efficiency_percentage  = var.number_of_ip_addresses != null ? floor((var.number_of_ip_addresses[key] / pow(2, 32 - value)) * 100 + 0.5) : null
    }
  }
}
