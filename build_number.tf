variable "RDS_USERNAME" {
  type = string
}

variable "RDS_PASSWORD" {
  type = string
}

resource "aws_db_instance" "build_number" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  name              = "build-number"
  username          = var.RDS_USERNAME
  password          = var.RDS_PASSWORD
}
