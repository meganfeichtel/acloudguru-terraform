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

#security group
resource "aws_security_group" "webdmz" {
  name        = "webDMZ"
  description = "Allow demilitarized zone"
  vpc_id      = "vpc-fbde4a81"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# creates an ec2 resource
resource "aws_instance" "example" {
  ami = "ami-06b382aba6c5a4f2c"
  instance_type = "t2.micro"
  tags {
    Name = "megan-feichtel-test-instance-01"
    Department = "Developers"
    EmployeeID = "01"
  }
  disable_api_termination = true
  security_groups = ["${aws_security_group.webdmz.id}"]
}
