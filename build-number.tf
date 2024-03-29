variable "RDS_USERNAME" {
  type = string
}

variable "RDS_PASSWORD" {
  type = string
}

resource "aws_db_instance" "build_number" {
  allocated_storage         = 20
  identifier                = "build-number"
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t3.micro"
  db_name                   = "build_number"
  username                  = var.RDS_USERNAME
  password                  = var.RDS_PASSWORD
  publicly_accessible       = true
  skip_final_snapshot       = true
  final_snapshot_identifier = "build-number-final-snapshot"
  vpc_security_group_ids    = [aws_security_group.build-number-sg.id]
}
