resource "aws_iam_role" "instance_role" {
  name        = local.instance_role_name
  description = "Enable SSM for EC2"
  assume_role_policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
      {
        "Action" = "sts:AssumeRole"
        "Effect" = "Allow",
        "Principal" = {
          "Service" = "ec2.amazonaws.com"
        },
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "instance_role_policy_attachment" {
  name       = local.instance_role_policy_attachment_name
  roles      = [aws_iam_role.instance_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = local.instance_profile_name
  role = aws_iam_role.instance_role.name
}