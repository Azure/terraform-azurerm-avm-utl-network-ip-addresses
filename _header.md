# Azure Verified Utility Module for generating IPv4 CIDR address prefixes

This module generates IPv4 CIDR address prefixes for a specified address space. It is not a replacement for a full IPAM solution, but can be used in simple cases where a full IPAM solution is not needed.

## What it does

This module helps you divide a network address space into smaller subnets. You can use it in two ways:

- **Traditional approach**: Specify CIDR prefix sizes (like /24, /26, /28)
- **IP count approach**: Just say how many IP addresses you need and the module calculates the right CIDR size

The module can optimize subnet placement for efficient use of your address space or keep them in the order you specify.
