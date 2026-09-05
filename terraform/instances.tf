resource "aws_instance" "web01" {
  ami                         = var.AMI_ID
  instance_type               = var.INSTANCE_TYPE
  subnet_id                   = aws_subnet.subnet-pub-1.id
  key_name                    = var.KEY_NAME
  vpc_security_group_ids      = [aws_security_group.sg-test.id]
  availability_zone           = var.ZONE1
  associate_public_ip_address = true

  tags = {
    Name = "Test Instance"
  }
}

resource "aws_instance" "PromAndGraph" {
  ami                         = var.AMI_ID
  instance_type               = var.INSTANCE_TYPE
  subnet_id                   = aws_subnet.subnet-pub-2.id
  key_name                    = var.KEY_NAME
  vpc_security_group_ids      = [aws_security_group.sg-PromAndGraph.id]
  availability_zone           = var.ZONE2
  associate_public_ip_address = true


  tags = {
    Name = "Prom/Graph Server"
  }
}
