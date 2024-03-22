resource "aws_instance" "ec2" {
  for_each                    = local.instances
  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  key_name                    = each.value.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = each.value.security
  subnet_id = aws_subnet.subnet.id
  tags = {
    Name = each.key
  }

  provisioner "remote-exec" {
    connection {
    type = "ssh"
    user = "ec2-user"
    private_key = tls_private_key.tlskey.private_key_pem
    host = self.public_ip 
    }

    inline = [
        "sudo yum install -y git",
        "sudo amazon-linux-extras install -y java-openjdk11",
        "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
        "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key",
        "sudo yum install -y jenkins"
    ]
  }
}