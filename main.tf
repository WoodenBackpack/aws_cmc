provider "aws" {
	region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNbrjX29NjCECswI/kr4ujAK+ziAGKrrONF9HSkFxcL5gujM5o4fVGC5ObAJFuXKXO/e/Tz6pFe+CE730juF3BuBIhJv7j1PM/LORIEn9IASPluXMJl6LaUIZ8XH8ekoMPQC2i9rByyleUfhPUB9LQhb4BrreEkOixwA8zlQ9gISK70OxAdIjmh+JBWtELWdamKEcJDpZMcO83NAylASc/8NrSkrgA4IMskfiRGfNtmI2Q3AOUHznQ+0PFxV3LLwQCJrKT+YjPeSlt7dDAHzAAnM8RmwzNClExqRsQSlcF/GMuS3ZKZfJDvySeICLTRQU9KVehtbX2XCIXyBO1D+r9JEz+aqxHl5K4N25XgVx+sDG+3LRQ6bsUSzWXEeNxreuv5j26Czxt8v107WUYFEdoS9CzLEnn1v1Cik/X1S6v9hHi+8gBVKPM+89de4WbXOZyX+rtRBthKqG3TdSpD/h4gCOr+ywBy+Aebdo/vNsv1nv9aNlt6wxQgC/2jbn19cE= piotr@piotr-VirtualBox"
}

resource "aws_instance" "web" {
	instance_type = "t2.micro"
	ami = "ami-0dc2d3e4c0f9ebd18"
	key_name = aws_key_pair.deployer.key_name
	tags = {
		Name = "web page"
	}

}
