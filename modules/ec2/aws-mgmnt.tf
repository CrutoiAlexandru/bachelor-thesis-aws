resource "aws_instance" "server-mgmnt" {
  ami           = "ami-0d497a49e7d359666"
  instance_type = "t2.micro"

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.aws-mgmnt-sg.id]

  iam_instance_profile = aws_iam_instance_profile.mgmnt-profile.name

  tags = {
    Name = "server-mgmnt"
  }
}