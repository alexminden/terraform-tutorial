resource "aws_iam_role" "system-role" {
  name = var.iamName[0]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attachpolicy" {
  role       = aws_iam_role.system-role.name
  count  = length(var.policies)
  policy_arn = "${var.policies[count.index]}"
}

resource "aws_iam_instance_profile" "profile" {
  name = var.iamName[1]
  role =  aws_iam_role.system-role.name
}

output "iam_profile" {
  value       = aws_iam_instance_profile.profile.name
  description = "The Iam profile name."
}