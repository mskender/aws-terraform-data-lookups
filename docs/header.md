# Data lookup module

The best practice is to keep your compute terraform project separate from your network one.

This module ensures ready-made data and name-generating outputs in your compute project if you provisioned your network with [aws-terraform-network](https://github.com/mskender/aws-terraform-network) module.


## Example

```
module "lookup" {
  source                 = "github.com/mskender/aws-terraform-data-lookups.git"
  prefix                 = "my_vpc_prefix"
  lookup_private_subnets = var.create_private_subnets
}

# Getting references from module

locals {

  psql01_name = module.lookup.psql["01"]
  eks05_name = module.lookup.psql["05"]
  psql_name = module.lookup.psql["01"]
   
  
  all_subnets = module.lookup.subnets
  subnet_1a_id = module.lookup.public_subnets_map["1a"].id
  
  private_subnet_ids = module.lookup.private_subnet_ids
  public_subnet_ids = module.lookup.public_subnet_ids

  vpc_id = module.lookup.vpc.id

  availability_zones = module.lookup.availability_zones

  default_sg = module.lookup.default_sg

} 

```