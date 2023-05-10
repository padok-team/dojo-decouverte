output "public_instance_ip" {
  value       = aws_instance.public.public_ip
  description = "IP of the public instance"
}
