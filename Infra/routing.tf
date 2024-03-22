resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "sl_vpc"
    }
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    depends_on = [ aws_vpc.vpc ]
    tags = {
        Name = "sl_subnet"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "sl_route_table"
    }

}

resource "aws_route_table_association" "rt_assoc" {
    subnet_id = aws_subnet.subnet.id
    route_table_id = aws_route_table.rt.id
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    depends_on = [ aws_vpc.vpc ]
    tags = {
      Name = "sl_igw"
    }

}

resource "aws_route" "route" {
  route_table_id = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id

}