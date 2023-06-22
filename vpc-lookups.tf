locals {
    private_subnet_ids = var.lookup_private_subnets ? data.aws_subnets.private[0].ids:[]
    public_subnet_ids = var.lookup_public_subnets ? data.aws_subnets.public[0].ids:[]
    suffix = var.suffix == "" ? "" : "-${var.suffix}"

    private_subnets_number = var.private_subnets_per_az*length(data.aws_availability_zones.available.names) 
    public_subnets_number = var.public_subnets_per_az*length(data.aws_availability_zones.available.names) 
}

data "aws_availability_zones" "az" {
  all_availability_zones = true
}
### VPC
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [
        "${var.prefix}-vpc*${local.suffix}"
    ]
  }
}
data "aws_subnets" "private" {
  count = var.lookup_private_subnets ? 1:0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = [        
        "${var.prefix}-private*${local.suffix}"
    ]
  }
}

data "aws_subnets" "public" {
  count = var.lookup_public_subnets ? 1:0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = [
        "${var.prefix}-public*${local.suffix}"
    ]
  }
}


data "aws_subnet" "private" {
  for_each = toset(local.private_subnet_ids)
  id       = each.key
}

data "aws_subnet" "public" {
  for_each = toset(local.public_subnet_ids)
  id       = each.key
}
### SUB BY SUB

data "aws_subnet" "public_subnets" {
  count = var.lookup_public_subnets ? var.public_subnets_per_az : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = [        
        "${var.prefix}-public-${split("-",element(data.aws_availability_zones.available.names, count.index))[2]}${local.suffix}",
    ]
  }
}


data "aws_subnet" "private_subnets" {
  count = var.lookup_private_subnets ? 1:0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = [
        "${var.prefix}-private-${split("-",element(data.aws_availability_zones.available.names, count.index))[2]}${local.suffix}",
    ]
  }
}



data "aws_availability_zones" "available" {
  state = "available"
}
