resource "aws_security_group" "build-number-sg" {
  name = "build-number-sg"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}