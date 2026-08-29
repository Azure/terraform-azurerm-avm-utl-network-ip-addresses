output "comparison_summary" {
  description = "Summary comparing IP count approach vs traditional CIDR approach"
  value = {
    ip_count_approach = {
      for key, details in module.address_prefixes_by_ip_count.address_prefixes_with_details :
      key => {
        requested_ips  = details.requested_ip_addresses
        actual_ips     = details.actual_ip_addresses
        cidr_allocated = details.cidr_range
        efficiency     = "${details.efficiency_percentage}%"
      }
    }
    traditional_approach = {
      for key, details in module.traditional_cidr_comparison.address_prefixes_with_details :
      key => {
        cidr_size      = details.cidr_prefix_size
        actual_ips     = details.actual_ip_addresses
        cidr_allocated = details.cidr_range
      }
    }
  }
}

output "efficient_address_prefixes_ordered" {
  value = module.efficient_address_prefixes_ordered.address_prefixes
}

output "efficient_address_prefixes_ordered_with_details" {
  value = module.efficient_address_prefixes_ordered.address_prefixes_with_details
}

output "efficient_address_prefixes_unordered" {
  value = module.efficient_address_prefixes_unordered.address_prefixes
}

output "efficient_address_prefixes_unordered_with_details" {
  value = module.efficient_address_prefixes_unordered.address_prefixes_with_details
}

output "inefficient_address_prefixes_ordered" {
  value = module.inefficient_address_prefixes_ordered.address_prefixes
}

output "inefficient_address_prefixes_ordered_with_details" {
  value = module.inefficient_address_prefixes_ordered.address_prefixes_with_details
}

output "inefficient_address_prefixes_unordered" {
  value = module.inefficient_address_prefixes_unordered.address_prefixes
}

output "inefficient_address_prefixes_unordered_with_details" {
  value = module.inefficient_address_prefixes_unordered.address_prefixes_with_details
}

output "ip_count_based_details" {
  description = "Detailed information about IP count based prefixes including efficiency"
  value       = module.address_prefixes_by_ip_count.address_prefixes_with_details
}

# Outputs for IP address count approach
output "ip_count_based_prefixes" {
  description = "Address prefixes calculated from IP address counts"
  value       = module.address_prefixes_by_ip_count.address_prefixes
}

output "traditional_cidr_comparison_prefixes" {
  description = "Address prefixes using traditional CIDR approach for comparison"
  value       = module.traditional_cidr_comparison.address_prefixes
}
