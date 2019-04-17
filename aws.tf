variable "access_key" {
  description = "Your API access key"
}

variable "secret_key" {
  description = "Your API secret key"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-2d39803a"
  instance_type = "t2.micro"
  tags {
    Name = "megan-feichtel-test-instance"
  }
}
