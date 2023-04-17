resource "aws_instance" "jenkins-server" {
  ami           = "ami-0d497a49e7d359666"
  instance_type = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "jenkins-server"
  }
}