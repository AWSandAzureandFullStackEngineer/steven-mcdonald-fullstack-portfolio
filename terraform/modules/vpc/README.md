# VPC Module

This module creates a VPC along with public and private subnets, an Internet Gateway, and public route tables.

## Inputs

- `name`: Name of the VPC.
- `vpc_cidr`: CIDR block for the VPC.
- `public_subnets`: List of public subnet CIDR blocks.
- `private_subnets`: List of private subnet CIDR blocks.
- `availability_zones`: List of availability zones.

## Outputs

- `vpc_id`: ID of the VPC.
- `public_subnets`: IDs of the public subnets.
- `private_subnets`: IDs of the private subnets.

