module "db" {
	source = "terraform-aws-modules/rds/aws"
	version = "~> 3.0"
	identifier = "demodb-2"
	engine = "mysql"
	engine_version = "5.7.19"
	instance_class = "db.t2.micro"
	tags = {
		Name = "Products"
	}
	major_engine_version = "5.7"
	subnet_ids = [aws_subnet.public_subneta.id, aws_subnet.public_subnetb.id]
	family = "mysql5.7"
	allocated_storage = 5
	password = "password"
	username = "user"	

}
