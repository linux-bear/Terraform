//This is using my own rsa key that I generated, for tfinstance3
# resource "aws_key_pair" "ssh_key" {
#   key_name   = "dook"
#   public_key = file(var.public_key)
# }

resource "tls_private_key" "tlskey"{
    algorithm = "RSA"
}

resource "aws_key_pair" "keypair" {
    key_name = var.keyname
    public_key = tls_private_key.tlskey.public_key_openssh
}

resource "local_file" "localfile" {
    content = tls_private_key.tlskey.private_key_pem
    filename = "ec2-key.pem"
}  