locals {
  private_subnet_ids = var.lookup_private_subnets ? data.aws_subnets.private[0].ids : []
  public_subnet_ids  = var.lookup_public_subnets ? data.aws_subnets.public[0].ids : []


}

data "aws_availability_zones" "az" {
  all_availability_zones = true
}
### VPC
data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-vpc"
    ]
  }
}
data "aws_subnets" "private" {
  count = var.lookup_private_subnets ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-private*"
    ]
  }
}

data "aws_subnets" "public" {
  count = var.lookup_public_subnets ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-public*"
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

data "aws_subnet" "public_a" {
  count = var.lookup_public_subnets ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-public-${split("-", element(data.aws_availability_zones.available.names, 0))[2]}"
    ]
  }
}
data "aws_subnet" "public_b" {
  count = var.lookup_public_subnets ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-public-${split("-", element(data.aws_availability_zones.available.names, 1))[2]}"
    ]
  }
}
data "aws_subnet" "public_c" {

  count = var.lookup_public_subnets ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-public-${split("-", element(data.aws_availability_zones.available.names, 2))[2]}"
    ]
  }
}

data "aws_subnet" "private_a" {
  count = var.lookup_private_subnets ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-private-${split("-", element(data.aws_availability_zones.available.names, 0))[2]}"
    ]
  }
}
data "aws_subnet" "private_b" {
  count = var.lookup_private_subnets ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-private-${split("-", element(data.aws_availability_zones.available.names, 1))[2]}"
    ]
  }
}
data "aws_subnet" "private_c" {
  count = var.lookup_private_subnets ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "${var.prefix}-private-${split("-", element(data.aws_availability_zones.available.names, 1))[2]}"
    ]
  }
}


data "aws_availability_zones" "available" {
  state = "available"
}
