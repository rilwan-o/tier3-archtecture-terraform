# Create a load balancer
resource "aws_lb" "loadbalancer_internet_app" {
  name            = "loadbalancer-internet"
  subnets         = aws_subnet.public[*].id
  security_groups = [aws_security_group.sg.id]
  internal        = false
}

resource "aws_lb" "loadbalancer_internal_app" {
  name            = "loadbalancer-internal"
  subnets         = aws_subnet.private[*].id
  security_groups = [aws_security_group.sg.id]
  internal        = true
}