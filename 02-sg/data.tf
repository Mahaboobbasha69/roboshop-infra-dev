data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_vpc" "default" {
  default = true
}



# Purpose:
# Reads existing VPC details

# Does NOT create anything

# Used only for reference

# 👉 Think of data as read-only