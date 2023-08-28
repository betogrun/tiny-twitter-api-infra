variable "vpc_id" {
  description = "The VPC ID where the RDS instance will be launched."
  type        = string
}

variable "private_subnet1_id" {
  description = "Private subnet ID of the first private subnet for the RDS instance"
  type        = string
}

variable "private_subnet2_id" {
  description = "Private subnet ID of the second private subnet for the RDS instance"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ec2_sg_id" {
  description = "ID do Security Group do EC2"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
}

variable "db_username" {
  description = "The username for the database."
  type        = string
}

variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive  = true
}
