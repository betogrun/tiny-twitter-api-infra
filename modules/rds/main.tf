resource "aws_db_instance" "tiny_twitter_db" {
  allocated_storage     = 20
  storage_type          = "gp2"
  instance_class        = "db.t3.micro"
  engine                = "postgres"
  engine_version        = "15"
  identifier           = "tiny-twitter-db"
  db_name               = var.db_name
  username              = var.db_username
  password              = var.db_password
  skip_final_snapshot   = true
  backup_retention_period = 0
  publicly_accessible   = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id] 
  db_subnet_group_name   = aws_db_subnet_group.tiny_twitter_db_subnet_group.name
}

resource "aws_db_subnet_group" "tiny_twitter_db_subnet_group" {
  name       = "tinytwitterdb-subnet-group"
  subnet_ids  = [var.private_subnet1_id, var.private_subnet2_id]

  tags = {
    Name = "tinytwitterdb-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "tiny-twitter-rds-sg"
  description = "Security group for Tiny Twitter RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [var.ec2_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tiny-twitter-rds-sg"
  }
} 