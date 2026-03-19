


# Traditional CIDR prefix approach examples
# These examples demonstrate using CIDR prefix sizes (like /28, /26) directly

module "efficient_address_prefixes_ordered" {
  source = "../../"

  address_space    = var.address_space
  address_prefixes = var.address_prefixes_ordered
  enable_telemetry = var.enable_telemetry
}

module "inefficient_address_prefixes_ordered" {
  source = "../../"

  address_space                 = var.address_space
  address_prefix_efficient_mode = false
  address_prefixes              = var.address_prefixes_ordered
  enable_telemetry              = var.enable_telemetry
}

module "efficient_address_prefixes_unordered" {
  source = "../../"

  address_space    = var.address_space
  address_prefixes = var.address_prefixes_unordered
  enable_telemetry = var.enable_telemetry
}

module "inefficient_address_prefixes_unordered" {
  source = "../../"

  address_space                 = var.address_space
  address_prefix_efficient_mode = false
  address_prefixes              = var.address_prefixes_unordered
  enable_telemetry              = var.enable_telemetry
}

# IP address count approach examples
# These examples demonstrate specifying the number of IP addresses needed
# instead of CIDR prefix sizes - the module automatically calculates the optimal CIDR size

module "address_prefixes_by_ip_count" {
  source = "../../"

  address_space                 = var.ip_count_address_space
  address_prefix_efficient_mode = var.address_prefix_efficient_mode
  enable_telemetry              = var.enable_telemetry
  # Specify the number of IP addresses needed for each subnet
  number_of_ip_addresses = var.number_of_ip_addresses
}

# Comparison example showing equivalent traditional CIDR approach
module "traditional_cidr_comparison" {
  source = "../../"

  address_space                 = var.comparison_address_space
  address_prefix_efficient_mode = var.address_prefix_efficient_mode
  # Traditional approach with CIDR prefix sizes equivalent to the IP count example
  address_prefixes = var.comparison_address_prefixes
  enable_telemetry = var.enable_telemetry
}








