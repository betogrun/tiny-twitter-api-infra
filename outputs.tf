output "ec2_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2.ec2_public_ip
}
