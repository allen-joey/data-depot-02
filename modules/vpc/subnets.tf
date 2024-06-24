# Resource blocks below define the required public and private subnets

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.azs, count.index)

  ipv6_cidr_block                 = aws_vpc.main.assign_generated_ipv6_cidr_block ? cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index) : null
  assign_ipv6_address_on_creation = true

  tags = {
    Name       = "Public-Subnet-${count.index + 1}"
    Managed_By = "terraform"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name       = "Private-Subnet-${count.index + 1}"
    Managed_By = "terraform"
  }
}