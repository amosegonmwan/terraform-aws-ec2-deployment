### Security Group ###
resource "aws_security_group" "web_sg" {
  name        = "dev-web-sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg-tag-name
  }
}


### EC2 Instance ###
resource "aws_instance" "web_server" {
  ami             = data.aws_ami.amazon_linux_2.id
  instance_type   = var.instance_type
  key_name        = "us-west-2"
  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Welcome to WemaDevOps Inc, from $(hostname -f)</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = var.ec2-tag-name
  }
}
