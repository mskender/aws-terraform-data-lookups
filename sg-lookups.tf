
locals {
    suffix = var.suffix == "" ? "" : "-${var.suffix}"
}

data "aws_security_group" "deault_sg" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = ["${var.prefix}-sgp-outbound-default${local.suffix}"]
  }

}
