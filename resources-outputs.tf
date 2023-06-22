output "rds" {
    value = { for i in range(1, var.resource_name_limit+1):    
        format("%02s", tostring(i))  => format("${var.prefix}-RDS-%02s${local.suffix}",i)
    }
    description = "Generates resource map in format {prefix}-RDS-{number}-{suffix}. The map key is the number {01...var.resource_name_limit} and the value is generated name."
}

output "eks" {
    value = { for i in range(1, var.resource_name_limit+1):    
        format("%02s", tostring(i))  => format("${var.prefix}-EKS-%02s${local.suffix}",i)
    }
    description = "Generates resource map in format {prefix}-EKS-{number}-{suffix}. The map key is the number {01...var.resource_name_limit} and the value is generated name."
}

output "mysql" {
    value = { for i in range(1, var.resource_name_limit+1):    
        format("%02s", tostring(i))  => format("${var.prefix}-MYSQL-%02s${local.suffix}",i)
    }
    description = "Generates resource map in format {prefix}-MYSQL-{number}-{suffix}. The map key is the number {01...var.resource_name_limit} and the value is generated name."
}

output "psql" {
    value = { for i in range(1, var.resource_name_limit+1):    
        format("%02s", tostring(i))  => format("${var.prefix}-PSQL-%02s${local.suffix}",i)
    }
    description = "Generates resource map in format {prefix}-PSQL-{number}-{suffix}. The map key is the number {01...var.resource_name_limit} and the value is generated name."
}

output "ec2" {
    value = { for i in range(1, var.resource_name_limit+1):    
        format("%02s", tostring(i))  => format("${var.prefix}-EC2-%02s${local.suffix}",i)
    }
    description = "Generates resource map in format {prefix}-EC2-{number}-{suffix}. The map key is the number {01...var.resource_name_limit} and the value is generated name."
}

output "sg" {
    value = { for i in range(1, var.resource_name_limit+1):    
        format("%02s", tostring(i))  => format("${var.prefix}-SG-%02s${local.suffix}",i)
    }
    description = "Generates resource map in format {prefix}-SG-{number}-{suffix}. The map key is the number {01...var.resource_name_limit} and the value is generated name."
}