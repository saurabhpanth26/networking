resource "aws_security_group" "open_port" {
  name = "saurabh.2611-security-group"
  vpc_id = aws_vpc.main-vpc.id
  ingress {
  description = "allow all traffic"
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  description = "allow unlimited egress"
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
  }
}

