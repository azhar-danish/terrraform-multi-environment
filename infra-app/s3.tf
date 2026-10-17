resource aws_s3_bucket my-bucket {
	
    bucket = "${var.env}-${var.bucket_name}"
	region = "ap-south-1"

    tags = {
        Name =  "${var.env}-${var.bucket_name}"
        Environment = var.env
    }
}
