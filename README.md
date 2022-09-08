# Data lookup module

The purpose of this module is to provide simple and data lookup module.
It's compatible with:

- aws-terraform-network module

## Example

```
module "lookup" {
  source                 = "github.com/mskender/aws-terraform-data-lookups.git"
  prefix                 = "my_vpc_prefix"
  lookup_private_subnets = var.create_private_subnets
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.38.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=3.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_availability_zones.az](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lookup_private_subnets"></a> [lookup\_private\_subnets](#input\_lookup\_private\_subnets) | Whether to lookup private subnets | `bool` | `true` | no |
| <a name="input_lookup_public_subnets"></a> [lookup\_public\_subnets](#input\_lookup\_public\_subnets) | Whether to lookup public subnets | `bool` | `true` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A network prefix to filter by. Mandatory. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_subnet_ids"></a> [all\_subnet\_ids](#output\_all\_subnet\_ids) | Returns a list of all prefixed subnet ID's. |
| <a name="output_availability_zones"></a> [availability\_zones](#output\_availability\_zones) | Lists Available AZ's in current region |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | Returns a list of private subnet ID's for prefixed VPC. |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of private subnets. |
| <a name="output_private_subnets_map"></a> [private\_subnets\_map](#output\_private\_subnets\_map) | Map of private subnets. Can be referenced by the letter [a\|b\|c], i.e. private\_subnets['a'].id |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | Returns a list of public subnet ID's for prefixed VPC. |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of public subnet |
| <a name="output_public_subnets_map"></a> [public\_subnets\_map](#output\_public\_subnets\_map) | Map of public subnets. Can be referenced by the letter [a\|b\|c], i.e. private\_subnets['a'].id |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | List of all the subnets |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | Returns reference to the prefixed VPC. |
