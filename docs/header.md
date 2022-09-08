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
