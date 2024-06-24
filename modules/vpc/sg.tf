# Public Security Group

resource "aws_security_group" "public_sg" {
  name        = "Public-SG"
  description = "Public Internet Access"
  vpc_id      = aws_vpc.main.id

  ingress { # Port for SSH
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.location}"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress { # Port for Webmin
    from_port        = 59153
    to_port          = 59153
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress { # Port for http
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress { # Port for https
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name       = "Public-SG"
    Managed_By = "terraform"
  }
}