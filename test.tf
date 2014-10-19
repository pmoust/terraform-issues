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

resource "aws_route53_zone" "foo" {
    name = "bar.com"
}

resource "aws_route53_record" "dkim" {
    zone_id = "${aws_route53_zone.foo.id}"
    name    = "bar.com"
    type    = "TXT"
    ttl     = "300"
    records = ["lalalala"]
}
