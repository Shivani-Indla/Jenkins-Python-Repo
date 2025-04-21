provider "aws" {
  region     = "us-east-1"
}
resource "aws_instance" "foo" {
  ami           = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"

  tags = {
    Name = "TF-Instance"
  }
}
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
