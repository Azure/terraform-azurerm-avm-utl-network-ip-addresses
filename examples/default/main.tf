variable "address_space" {
  type        = string
  description = "The address space that is used the virtual network in CIDR notation"
  default     = "10.0.0.0/22"
}

variable "address_prefixes_ordered" {
  type        = map(number)
  description = "The size of the subnets"
  default = {
    "a" = 28
    "b" = 26
    "c" = 26
    "d" = 27
  }
}

variable "address_prefixes_unordered" {
  type        = map(number)
  description = "The size of the subnets"
  default = {
    "d" = 27
    "c" = 26
    "b" = 26
    "a" = 28
  }
}

# This is the module call
module "efficient_address_prefixes_ordered" {
  source = "../../"

  address_space    = var.address_space
  address_prefixes = var.address_prefixes_ordered

  enable_telemetry = var.enable_telemetry
}

module "inefficient_address_prefixes_ordered" {
  source = "../../"

  address_space                 = var.address_space
  address_prefixes              = var.address_prefixes_ordered
  address_prefix_efficient_mode = false

  enable_telemetry = var.enable_telemetry
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
  address_prefixes              = var.address_prefixes_unordered
  address_prefix_efficient_mode = false

  enable_telemetry = var.enable_telemetry
}

output "efficient_address_prefixes_ordered" {
  value = module.efficient_address_prefixes_ordered.address_prefixes
}

output "inefficient_address_prefixes_ordered" {
  value = module.inefficient_address_prefixes_ordered.address_prefixes
}

output "efficient_address_prefixes_unordered" {
  value = module.efficient_address_prefixes_unordered.address_prefixes
}

output "inefficient_address_prefixes_unordered" {
  value = module.inefficient_address_prefixes_unordered.address_prefixes
}

output "efficient_address_prefixes_ordered_with_details" {
  value = module.efficient_address_prefixes_ordered.address_prefixes_with_details
}

output "inefficient_address_prefixes_ordered_with_details" {
  value = module.inefficient_address_prefixes_ordered.address_prefixes_with_details
}

output "efficient_address_prefixes_unordered_with_details" {
  value = module.efficient_address_prefixes_unordered.address_prefixes_with_details
}

output "inefficient_address_prefixes_unordered_with_details" {
  value = module.inefficient_address_prefixes_unordered.address_prefixes_with_details
}
