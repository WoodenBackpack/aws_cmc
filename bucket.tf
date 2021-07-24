



resource "aws_s3_bucket" "epiowro-another-bucket" {
	bucket = "another-epiowro-bucket"	
	acl = "public-read"
	website {
		index_document = "index.html"
	}
	tags = {
		Name = "Test Bucket"
	}
}
