resource "aws_db_security_group" "build-number-sg" {
  name = "build-number-sg"

  ingress {
    cidr = "0.0.0.0/0"
  }
}