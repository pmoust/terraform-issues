variable "aws_access_key" {
    description = "Your AWS access key"     
}
variable "aws_secret_key" {
    description = "Your AWS secret key"     
}
variable "aws_region" {
    description = "AWS Region (defaults to N.Virginia)"
    default     = "us-east-1"
}
provider "aws" {
    access_key  = "${var.aws_access_key}"
    secret_key  = "${var.aws_secret_key}"
    region      = "${var.aws_region}"
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "bar" {
    name = "foo"
    description = "testing"
    vpc_id = "${aws_vpc.vpc.id}"

    ingress {
        from_port = 22
        to_port = 22 
        protocol = "tcp"
        cidr_blocks = ["1.1.1.1/32"]
    }
    ingress {
        from_port = 22
        to_port = 23 
        protocol = "tcp"
        cidr_blocks = ["1.1.1.2/32"]
    }
    ingress {
        from_port = 22
        to_port = 24 
        protocol = "tcp"
        cidr_blocks = ["1.1.1.3/32"]
    }
    ingress {
        from_port = 22
        to_port = 22 
        protocol = "tcp"
        cidr_blocks = ["1.1.1.4/32"]
    }
    ingress {
        from_port = 22
        to_port = 22 
        protocol = "tcp"
        cidr_blocks = ["1.1.1.5/32"]
    }
}
