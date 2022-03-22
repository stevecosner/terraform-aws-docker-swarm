provider "aws" {
  region     = "us-east-2"
}


resource "aws_instance" "web1" {
  ami           = "ami-0b32ec75f2cd21d30"
  instance_type = "t2.micro"
  user_data          = "${file("web.conf")}"
  key_name = "id_rsa"
}






output "public_instance_ip1" {
  value = aws_instance.web1.public_ip
}




