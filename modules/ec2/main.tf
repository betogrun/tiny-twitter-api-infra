resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data     = file("${path.module}/scripts/setup_nginx.sh")

  tags = {
    Name = "tiny-twitter-api"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "tiny-twitter-api-key"
  public_key = file("~/.ssh/tiny-twitter-api-key.pub")
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Security Group for the EC2 instance"
  vpc_id      = var.vpc_id

  # Allow SSH inbound from any source
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP inbound from any source
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tiny-twitter-api-ec2-sg"
  }
}
