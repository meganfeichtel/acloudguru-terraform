#sets up variables provided from external files
variable "access_key" {
  description = "Your API access key"
}
variable "secret_key" {
  description = "Your API secret key"
}

#sets up aws connection using secrets from above
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1"
}


#creates versioned s3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "acloudguru-2019-mfeichtel-versioned"
  acl    = "private"

  tags = {
    Name        = "Megan s3 bucket for A Cloud Guru versioning labs"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }

#this will add lifecycle rules for previous versions of files
  lifecycle_rule {
    # prefix  = "*" #limits to individual subdirs; if removed, lifecycle policy set to whole bucket
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }
}

#puts an object in versioned s3 bucket
resource "aws_s3_bucket_object" "object" {
  bucket = "acloudguru-2019-mfeichtel-versioned"
  key    = "helloworld.txt"
  source = "./files/helloworld.txt"
}
