variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
  default     = "tiny-twitter-api"
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the instance"
  type        = string
  # No default here because it's environment-specific and should be passed in.
}

variable "vpc_id" {
  description = "The VPC ID in which the EC2 instance will be deployed"
  type        = string
}

