resource "aws_instance" "ec2-dev" {
  ami           = "ami-0263c44154f888a42"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.Dev_Pvt_subnet.id
  
  tags = {
    Name = "dev_ec2"
  }
}