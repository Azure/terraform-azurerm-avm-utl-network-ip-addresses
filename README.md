<!-- BEGIN_TF_DOCS -->
# Azure Verified Utility Module for generating IPv4 CIDR address prefixes

This module generates IPv4 CIDR address prefixes for a specified address space. It is not a replacement for a full IPAM solution, but can be used in simple cases where a full IPAM solution is not needed.

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9, < 2.0)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 2.3)

- <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) (~> 0.3)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.5)

## Resources

The following resources are used by this module:

- [modtm_telemetry.telemetry](https://registry.terraform.io/providers/azure/modtm/latest/docs/resources/telemetry) (resource)
- [random_uuid.telemetry](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) (resource)
- [azapi_client_config.telemetry](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/client_config) (data source)
- [modtm_module_source.telemetry](https://registry.terraform.io/providers/azure/modtm/latest/docs/data-sources/module_source) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes)

Description: The desired prefixes with their CIDR range size

For example:

  {
    "a" = 28
    "b" = 26
    "c" = 26
    "d" = 27
  }

Type: `map(number)`

### <a name="input_address_space"></a> [address\_space](#input\_address\_space)

Description: The address space to create the prefixes from in CIDR notation

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_address_prefix_efficient_mode"></a> [address\_prefix\_efficient\_mode](#input\_address\_prefix\_efficient\_mode)

Description: This variable controls whether or not the address prefixes are created in an efficient way.  
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

Type: `bool`

Default: `true`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see <https://aka.ms/avm/telemetryinfo>.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

## Outputs

The following outputs are exported:

### <a name="output_address_prefixes"></a> [address\_prefixes](#output\_address\_prefixes)

Description: The calculated address prefixes as CIDR ranges

### <a name="output_address_prefixes_with_details"></a> [address\_prefixes\_with\_details](#output\_address\_prefixes\_with\_details)

Description: The calculated address prefixes as CIDR ranges with input details

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->