provider "aws" {
  region     = "ap-northeast-1"
}

resource "aws_instance" "example" {
  #ami-51a7aa2d (ap-southeast-1) ami-940cdceb (ap-northeast-1)
  ami           = "ami-940cdceb" 
  instance_type = "t2.micro"
  key_name = "darren-keypair"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}