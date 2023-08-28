output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.app.public_ip
}

output "ec2_sg_id" {
    description = "The ID of the EC2 security group"
    value       = aws_security_group.ec2_sg.id
}
