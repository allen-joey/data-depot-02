# Defining the VPC

resource "aws_vpc" "main" {
  cidr_block                       = "10.0.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name       = "VPC-EU-WEST-2"
    Managed_By = "terraform"
  }


  lifecycle {
    create_before_destroy = true
  }
}