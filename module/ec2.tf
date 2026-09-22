resource "aws_instance" "webserver" {
  ami             = var.amiid
  instance_type   = var.machinetype
  vpc_security_group_ids = [aws_security_group.global-sg-2025.id]
  subnet_id = "subnet-0d374b517c661d6d0"
  key_name        = var.keyname

  tags = {
    Name = var.mytag
  }
}
