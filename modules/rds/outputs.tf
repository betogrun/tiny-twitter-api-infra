output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.tiny_twitter_db.endpoint
}
