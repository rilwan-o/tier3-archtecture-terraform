#Creating Route Table
resource "aws_route_table" "route_public" {
  vpc_id = aws_vpc.custom.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "Route to internet"
  }
}

resource "aws_route_table" "route_private" {
  vpc_id = aws_vpc.custom.id
  count          = length(aws_subnet.private)

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_tb[count.index].id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "Route to internet"
  }
}

