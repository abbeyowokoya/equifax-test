

resource "aws_instance" "bastion-host" {
  ami             = "ami-09d95fab7fff3776c"
  instance_type   = "t2.micro"
  key_name        = "abso"
  subnet_id       = aws_subnet.prod-subnet-public-1.id
  vpc_security_group_ids = ["${aws_security_group.prod-SG.id}"]

  tags = {
    Name = "bastion-host"
  }
  
}


data "template_file" "user_data" {
  template = "${file("templates/web-server_data.tpl")}"
}

resource "aws_instance" "web-server" {
  ami             = "ami-09d95fab7fff3776c"
  instance_type   = "t2.micro"
  key_name        = "abso"
  subnet_id       = aws_subnet.prod-subnet-private-1.id
  vpc_security_group_ids = ["${aws_security_group.prod-SG.id}"]

  tags = {
    Name = "web-server"
  }

  user_data = "${data.template_file.user_data.rendered}"
}