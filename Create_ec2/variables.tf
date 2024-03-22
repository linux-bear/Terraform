variable "public_key" {
    type = string
    description = "path to public key for accessing the ec2 instance after creation."
}

variable "keyname" {
    type = string
    default = "ec2-key"
}