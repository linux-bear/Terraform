locals {
  instances = {
    # tfinstanceHomeKey = {
    #   //This instance has the home generated key
    #   ami           = data.aws_ami.ami.id
    #   instance_type = "t2.micro"
    #   key_name = aws_key_pair.ssh_key.key_name
    #   security = [aws_security_group.ec2_sg.id]

    # }

    # tfinstance4AnsibleKey = {
    #   //this instance is using the pre-created keys in amazon
    #   ami           = data.aws_ami.ami.id
    #   instance_type = "t2.micro"
    #   key_name = "AnsibleKeys"
    #   security = [aws_security_group.ec2_sg.id]
    # }
    
    InstanceMcInstanceFace = {
      ami           = data.aws_ami.ami.id
      instance_type = "t2.micro"
      key_name = var.keyname
      security = [aws_security_group.ec2_sg.id]
    }

    InstanceMcInstanceFace2 = {
      ami           = data.aws_ami.ami.id
      instance_type = "t2.micro"
      key_name = var.keyname
      security = [aws_security_group.ec2_sg.id]
    }

  }
}

data "aws_ami" "ami"{
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
        #values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
}