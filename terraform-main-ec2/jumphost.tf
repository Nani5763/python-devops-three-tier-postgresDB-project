resource "aws_instance" "ec2" {
  ami = "ami-0ebfd941bbafe70c6"
  key_name = "Practice"
  instance_type = "t2.large"
  subnet_id = aws_subnet.public_subnet-01.id
  associate_public_ip_address = true
  vpc_security_group_ids = [ aws_security_group.security-group.id ]
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  root_block_device {
    volume_size = 40
  }
  user_data = templatefile("./install_tools.sh", {})
  tags = {
    Name = "py-three-tier-project"
  }
}