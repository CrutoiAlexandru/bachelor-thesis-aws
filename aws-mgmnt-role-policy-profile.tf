
resource "aws_iam_role" "mgmnt-role" {
  name = "mgmnt-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "mgmnt-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.mgmnt-role.name
}

resource "aws_iam_instance_profile" "mgmnt-profile" {
  name = "mgmnt-profile"

  role = aws_iam_role.mgmnt-role.name
}