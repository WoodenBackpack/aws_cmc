resource "aws_vpc" "myVpc" {
	cidr_block = "10.0.0.0/16"
	tags = {
		name = "myVpc"
	}
}

resource "aws_subnet" "public_subneta" {
	vpc_id = aws_vpc.myVpc.id
	cidr_block = "10.0.11.0/24"
	availability_zone = "us-east-1a"
	map_public_ip_on_launch = true
	tags = {
		name = "PublicSubnet-A"
	}
}


resource "aws_subnet" "public_subnetb" {
	vpc_id = aws_vpc.myVpc.id
	cidr_block = "10.0.12.0/24"
	availability_zone = "us-east-1b"
	map_public_ip_on_launch = true
	tags = {
		name = "PublicSubnet-B"
	}
}
