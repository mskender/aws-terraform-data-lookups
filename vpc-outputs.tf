output "vpc" {
  description = "Returns reference to the prefixed VPC."
  value       = data.aws_vpc.vpc
}

output "private_subnet_ids" {

  description = "Returns a list of private subnet ID's for prefixed VPC."
  value       = var.lookup_private_subnets ? tolist(data.aws_subnets.private[0].ids) :[]
}

output "public_subnet_ids" {
  description = "Returns a list of public subnet ID's for prefixed VPC."
  value       = var.lookup_public_subnets ? tolist(data.aws_subnets.public[0].ids) :[]
}

output "all_subnet_ids" {
  description = "Returns a list of all prefixed subnet ID's."
  value       = concat( var.lookup_public_subnets ? tolist(data.aws_subnets.public[0].ids):[], var.lookup_private_subnets ? tolist(data.aws_subnets.private[0].ids):[])
}

output "private_subnets_map" {
  description = "Map of private subnets. Can be referenced by the letter [a|b|c], i.e. private_subnets['a'].id"
  value = var.lookup_private_subnets ? {
    for sub in data.aws_subnet.private :
    substr(sub.tags["Name"], -1, 1) => sub
  } : {}
}

output "public_subnets_map" {
  description = "Map of public subnets. Can be referenced by the letter [a|b|c], i.e. private_subnets['a'].id"
  value = var.lookup_public_subnets ? {
    for sub in data.aws_subnet.public :
    substr(sub.tags["Name"], -1, 1) => sub
  } :{}
}

output "private_subnets" {
  description = "List of private subnets."
  value       = var.lookup_private_subnets ? tolist(data.aws_subnet.private.*) :[]
}

output "public_subnets" {
  description = "List of public subnet"
  value       = var.lookup_public_subnets ? tolist(data.aws_subnet.public.*) :[]
}

output "subnets" {
  description = "List of all the subnets"
  value       = concat( var.lookup_public_subnets ? tolist(data.aws_subnet.private.*):[], var.lookup_private_subnets ? tolist(data.aws_subnet.public.*):[])

}

output "availability_zones" {

  description = "Lists Available AZ's in current region"
  value       = data.aws_availability_zones.available

}
