variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet1_cidr_block" {
  description = "The CIDR block for the first private subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet2_cidr_block" {
  description = "The CIDR block for the second private subnet"
  default     = "10.0.3.0/24"
}

output "private_subnet1_id" {
  description = "The ID of the first private subnet"
  value       = aws_subnet.private1.id
}

output "private_subnet2_id" {
  description = "The ID of the second private subnet"
  value       = aws_subnet.private2.id
}

variable "availability_zones" {
  description = "List of availability zones for the subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
