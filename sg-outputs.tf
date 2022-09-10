output "default_sg" {
    value = data.aws_security_group.deault_sg
}

output "default_sg_id" {
    value = data.aws_security_group.deault_sg.id
}