provider "aws" {
  region     = "us-east-2"
}



resource "aws_instance" "web2" {
  ami           = "ami-0b32ec75f2cd21d30"
  user_data          = "${file("web.conf")}"
  instance_type = "t2.micro"
  key_name = "id_rsa"
}

resource "aws_instance" "web3" {
  ami           = "ami-0b32ec75f2cd21d30"
  user_data          = "${file("web.conf")}"
  instance_type = "t2.micro"
  key_name = "id_rsa"
}





output "public_instance_ip2" {
  value = aws_instance.web2.public_ip
}

output "public_instance_ip3" {
  value = aws_instance.web3.public_ip
}





