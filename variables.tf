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