
resource "aws_security_group" "jenkins-server-sg" {
  name_prefix = "jenkins-server-sg"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}