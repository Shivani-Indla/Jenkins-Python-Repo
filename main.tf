provider "aws" {
  region     = "us-east-1"
}
resource "aws_instance" "foo" {
  ami           = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  key_name      = "SRK-Key"
  subnet_id     = "subnet-0da5d1190995a43ed"
  vpc_security_group_ids = ["sg-093350e2375367437"]
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/www/html/index.html
              systemctl start httpd
              systemctl enable httpd
              EOF
  tags = {
    Name = "TF-Instance"
  }
}
