resource "aws_instance" "jenkins-server" {
  ami                         = "ami-0d497a49e7d359666"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins-server-sg.id]

  tags = {
    Name = "jenkins-server"
  }
}