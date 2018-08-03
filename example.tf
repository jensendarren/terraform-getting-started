provider "aws" {
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  key_name = "darren-keypair"
  tags = {
    Name = "darren-test-machine"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}

output "ssh" {
  value = "ssh -i ~/workspace/clik/keys/${aws_instance.example.key_name}.pem ubuntu@${aws_eip.ip.public_ip}"
}