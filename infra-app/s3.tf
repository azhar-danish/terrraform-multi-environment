resource aws_s3_bucket my-bucket {
	
    bucket = "${var.bucket_name}"
	region = "ap-south-1"

    tags = {
        Name =  "${var.bucket_name}"
        Environment = var.env
    }
}
