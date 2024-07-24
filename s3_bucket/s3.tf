provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "my-tf-demo-bucket"

  versioning {
    enabled = "true"
  }

  tags = {
    Name = "My Demo Bucket"
  }

}

/* bucket - (Optional, Forces new resource) Name of the bucket. 
If omitted, Terraform will assign a random, unique name. 
Must be lowercase and less than or equal to 63 characters in length. 
The name must not be in the format "[bucket_name]--[azid]--x-s3"  */


/* Versioning is a means of keeping multiple variants of an object in the same bucket. 
You can use versioning to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket. 
With versioning, you can easily recover from both unintended user actions and application failures. */