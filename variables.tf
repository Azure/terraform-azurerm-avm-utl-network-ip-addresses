variable "address_prefixes" {
  type        = map(number)
  description = <<DESCRIPTION
The desired prefixes with their CIDR range size

For example:

  {
    "a" = 28
    "b" = 26
    "c" = 26
    "d" = 27
  }

DESCRIPTION
  nullable    = false
}

variable "address_space" {
  type        = string
  description = "The address space to create the prefixes from in CIDR notation"
  nullable    = false

  validation {
    condition     = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.address_space))
    error_message = "The address space must be in CIDR notation"
  }
}

variable "address_prefix_efficient_mode" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not the address prefixes are created in an efficient way.
If it is set to true, then the address prefixes will be created in an efficient way.
If it is set to false, then the address prefixes will be created in lexographical order by the map key.

For example with the address space 10.0.0.0/22 and the following prefixes:

  {
    "a" = 28
    "b" = 26
    "c" = 26
    "d" = 27
  }

This will create the following prefixes in efficient mode:

  {
    "a" = "10.0.0.160/28"
    "b" = "10.0.0.0/26"
    "c" = "10.0.0.64/26"
    "d" = "10.0.0.128/27"
  }

If it is set to false, then the address prefixes will be created in the order specified even if not the most efficient use of the address space:

  {
    "a" = "10.0.0.0/28"
    "b" = "10.0.0.64/26"
    "c" = "10.0.0.128/26"
    "d" = "10.0.0.192/27"
  }

WARNING: When using efficient mode, if you later add more prefixes to the map, the prefixes will be regenerated in the mosrt efficient order, so the original ordering may change.

DESCRIPTION
  nullable    = false
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
  nullable    = false
}
