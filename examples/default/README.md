<!-- BEGIN_TF_DOCS -->
# Default example

This example demonstates different ways to use the module.

```hcl
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
```

<!-- markdownlint-disable MD033 -->
## Requirements

No requirements.

## Resources

No resources.

<!-- markdownlint-disable MD013 -->
## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_address_prefixes_ordered"></a> [address\_prefixes\_ordered](#input\_address\_prefixes\_ordered)

Description: The size of the subnets

Type: `map(number)`

Default:

```json
{
  "a": 28,
  "b": 26,
  "c": 26,
  "d": 27
}
```

### <a name="input_address_prefixes_unordered"></a> [address\_prefixes\_unordered](#input\_address\_prefixes\_unordered)

Description: The size of the subnets

Type: `map(number)`

Default:

```json
{
  "a": 28,
  "b": 26,
  "c": 26,
  "d": 27
}
```

### <a name="input_address_space"></a> [address\_space](#input\_address\_space)

Description: The address space that is used the virtual network in CIDR notation

Type: `string`

Default: `"10.0.0.0/22"`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see <https://aka.ms/avm/telemetryinfo>.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

## Outputs

The following outputs are exported:

### <a name="output_efficient_address_prefixes_ordered"></a> [efficient\_address\_prefixes\_ordered](#output\_efficient\_address\_prefixes\_ordered)

Description: n/a

### <a name="output_efficient_address_prefixes_ordered_with_details"></a> [efficient\_address\_prefixes\_ordered\_with\_details](#output\_efficient\_address\_prefixes\_ordered\_with\_details)

Description: n/a

### <a name="output_efficient_address_prefixes_unordered"></a> [efficient\_address\_prefixes\_unordered](#output\_efficient\_address\_prefixes\_unordered)

Description: n/a

### <a name="output_efficient_address_prefixes_unordered_with_details"></a> [efficient\_address\_prefixes\_unordered\_with\_details](#output\_efficient\_address\_prefixes\_unordered\_with\_details)

Description: n/a

### <a name="output_inefficient_address_prefixes_ordered"></a> [inefficient\_address\_prefixes\_ordered](#output\_inefficient\_address\_prefixes\_ordered)

Description: n/a

### <a name="output_inefficient_address_prefixes_ordered_with_details"></a> [inefficient\_address\_prefixes\_ordered\_with\_details](#output\_inefficient\_address\_prefixes\_ordered\_with\_details)

Description: n/a

### <a name="output_inefficient_address_prefixes_unordered"></a> [inefficient\_address\_prefixes\_unordered](#output\_inefficient\_address\_prefixes\_unordered)

Description: n/a

### <a name="output_inefficient_address_prefixes_unordered_with_details"></a> [inefficient\_address\_prefixes\_unordered\_with\_details](#output\_inefficient\_address\_prefixes\_unordered\_with\_details)

Description: n/a

## Modules

The following Modules are called:

### <a name="module_efficient_address_prefixes_ordered"></a> [efficient\_address\_prefixes\_ordered](#module\_efficient\_address\_prefixes\_ordered)

Source: ../../

Version:

### <a name="module_efficient_address_prefixes_unordered"></a> [efficient\_address\_prefixes\_unordered](#module\_efficient\_address\_prefixes\_unordered)

Source: ../../

Version:

### <a name="module_inefficient_address_prefixes_ordered"></a> [inefficient\_address\_prefixes\_ordered](#module\_inefficient\_address\_prefixes\_ordered)

Source: ../../

Version:

### <a name="module_inefficient_address_prefixes_unordered"></a> [inefficient\_address\_prefixes\_unordered](#module\_inefficient\_address\_prefixes\_unordered)

Source: ../../

Version:

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->