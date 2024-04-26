resource "aws_nat_gateway" "nat_tb" {
  allocation_id  = aws_eip.lb[count.index].id
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.IGW]
}

resource "aws_eip" "lb" {
  count          = length(aws_subnet.private)
  domain   = "vpc"
}