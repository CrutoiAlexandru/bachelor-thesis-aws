resource "aws_instance" "jenkins-server" {
  ami                         = "ami-0d497a49e7d359666"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.jenkins-server-sg.id]

  tags = {
    Name = "jenkins-server"
  }
}

resource "aws_security_group" "jenkins-server-sg" {
  name_prefix = "jenkins-server-sg"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}