resource "aws_vpc" "Dev_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "Dev-VPC"
  }
}

resource "aws_subnet" "Dev_Pvt_subnet" {
  vpc_id            = aws_vpc.Dev_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1"

  tags = {
    Name = "dev_pvt_subnet"
  }
}
