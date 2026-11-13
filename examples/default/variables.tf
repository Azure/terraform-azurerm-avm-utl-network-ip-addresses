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
