variable "address_prefix_efficient_mode" {
  type        = bool
  default     = true
  description = "Whether to use efficient mode for address prefix allocation"
}

variable "address_prefixes_ordered" {
  type = map(number)
  default = {
    "a" = 28
    "b" = 26
    "c" = 26
    "d" = 27
  }
  description = "The size of the subnets"
}

variable "address_prefixes_unordered" {
  type = map(number)
  default = {
    "d" = 27
    "c" = 26
    "b" = 26
    "a" = 28
  }
  description = "The size of the subnets"
}

variable "address_space" {
  type        = string
  default     = "10.0.0.0/22"
  description = "The address space that is used the virtual network in CIDR notation"
}

variable "comparison_address_prefixes" {
  type = map(number)
  default = {
    "web-tier"     = 29 # /29 = 8 addresses
    "app-tier"     = 28 # /28 = 16 addresses
    "db-tier"      = 30 # /30 = 4 addresses
    "mgmt-subnet"  = 27 # /27 = 32 addresses
    "large-subnet" = 25 # /25 = 128 addresses
  }
  description = "Traditional CIDR prefix sizes for comparison with IP count approach"
}

# Variables for comparison example
variable "comparison_address_space" {
  type        = string
  default     = "10.2.0.0/22"
  description = "The address space for the comparison example"
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

# Variables for IP address count approach
variable "ip_count_address_space" {
  type        = string
  default     = "10.1.0.0/22"
  description = "The address space for the IP count based example"
}

variable "number_of_ip_addresses" {
  type = map(number)
  default = {
    "web-tier"     = 8   # Will get /29 (8 addresses)
    "app-tier"     = 16  # Will get /28 (16 addresses)
    "db-tier"      = 4   # Will get /30 (4 addresses)
    "mgmt-subnet"  = 32  # Will get /27 (32 addresses)
    "large-subnet" = 100 # Will get /25 (128 addresses, next power of 2)
  }
  description = "Number of IP addresses needed for each subnet"
}
