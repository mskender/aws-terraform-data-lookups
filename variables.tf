variable "prefix" {
    type = string
    description = "A network prefix to filter by. Mandatory."
}

variable "suffix" {
    type = string
    description = "A network suffix to filter by. Optional."
    default = ""
}

variable "lookup_private_subnets" {
    type=  bool
    description = "Whether to lookup private subnets"
    default = true

}

variable "lookup_public_subnets" {
    type=  bool
    description = "Whether to lookup public subnets"
    default = true

}

variable "private_subnets_per_az" {
    type=string
    description="How many private subnets there are per VPC"
    default=1
}

variable "public_subnets_per_az" {
    type=string
    description="How many public subnets there are per VPC"
    default=1
}

variable "resource_name_limit" {
    description = "How many of each resource names to generate"
    default = 10
    type = number
}