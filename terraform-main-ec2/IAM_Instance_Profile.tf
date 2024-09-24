resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.iam_role.name
}