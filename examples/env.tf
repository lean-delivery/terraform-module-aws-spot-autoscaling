resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "Env for test spot_autoscaling"
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id     = "${aws_vpc.test_vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Env for test spot_autoscaling"
  }
}
