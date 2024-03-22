resource "aws_security_group" "ec2_sg" {
  name   = "ec2-sg"
  description = "allows ssh and http"
  vpc_id = aws_vpc.vpc.id
  lifecycle {
    create_before_destroy = true
  }

  ingress{
    cidr_blocks       = ["90.240.143.49/32"]
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
  }

  ingress{
    cidr_blocks       = ["90.240.143.49/32"]
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
    #ipv6_cidr_blocks = ["::/0"]
  }

ingress{
    cidr_blocks       = ["90.240.143.49/32"]
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
    #ipv6_cidr_blocks = ["::/0"]
  }

  ingress{
    cidr_blocks       = ["90.240.143.49/32"]
    from_port         = 453
    protocol          = "tcp"
    to_port           = 453
    #ipv6_cidr_blocks = ["::/0"]
  }

  egress{
    cidr_blocks       = ["0.0.0.0/0"]
    from_port         = 0
    protocol          = "-1"
    to_port           = 0
    #ipv6_cidr_blocks = ["::/0"]
  }

}