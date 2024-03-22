output "aws_instances" {
  value = [for instance in aws_instance.ec2 : instance.public_ip]
}