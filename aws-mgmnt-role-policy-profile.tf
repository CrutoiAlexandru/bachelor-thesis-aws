resource "aws_iam_role" "mgmnt-role" {
  name = "mgmnt-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = [
            "ec2.amazonaws.com",
            "ec2-instance-connect.amazonaws.com",
            "rds.amazonaws.com"
          ]
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "mgmnt-ec2-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.mgmnt-role.name
}

resource "aws_iam_role_policy_attachment" "mgmnt-instance-connect-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/EC2InstanceConnect"
  role       = aws_iam_role.mgmnt-role.name
}

resource "aws_iam_role_policy_attachment" "mgmnt-db-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  role       = aws_iam_role.mgmnt-role.name
}

resource "aws_iam_instance_profile" "mgmnt-profile" {
  name = "mgmnt-profile"

  role = aws_iam_role.mgmnt-role.name
}
