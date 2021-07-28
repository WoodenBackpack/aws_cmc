



resource "aws_s3_bucket" "epiowro-another-bucket" {
	bucket = "another-epiowro-bucket"	
	acl = "public-read"
	website {
		index_document = "index.html"
		error_document = "index.html"
	}
	tags = {
		Name = "Test Bucket"
	}
}


resource "aws_s3_bucket_object" "object" {
	bucket = aws_s3_bucket.epiowro-another-bucket.id
	key = "index.html"
	source = "~/Desktop/git-repos/webpage/index.html"
	acl = "public-read"

}

