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

#creates main s3 bucket
resource "aws_s3_bucket" "b" {
  bucket = "acloudguru-2019-mfeichtel"
  acl    = "private"

  tags = {
    Name        = "Megan s3 bucket for A Cloud Guru Labs"
    Environment = "Dev"
  }
}
#puts an object in main s3 bucket
resource "aws_s3_bucket_object" "object" {
  bucket = "acloudguru-2019-mfeichtel"
  key    = "awsconsole.png"
  source = "./files/awsconsole.png"
  etag = "${filemd5("./files/awsconsole.png")}"
}


# #creates versioned s3 bucket
# resource "aws_s3_bucket" "b" {
#   bucket = "acloudguru-2019-mfeichtel-versioned"
#   acl    = "private"
#   tags = {
#     Name        = "Megan s3 bucket for A Cloud Guru versioning labs"
#     Environment = "Dev"
#   }

#   versioning {
#     enabled = true
#   }
# }
# #puts an object in versioned s3 bucket
# resource "aws_s3_bucket_object" "object" {
#   bucket = "acloudguru-2019-mfeichtel-versioned"
#   key    = "helloworld.txt"
#   source = "./files/helloworld.txt"
# }


#creates an ec2 resource
# resource "aws_instance" "example" {
#   ami = "ami-2d39803a"
#   instance_type = "t2.micro"
#   tags {
#     Name = "megan-feichtel-test-instance"
#   }
# }
