# NVIDIA Terraform config for NGC AWS Tutorial.
# Copyright (c) 2017, NVIDIA CORPORATION.  All rights reserved.

# If you followed the NGC AWS setup, no changes should be needed here.

data "aws_ami" "nv_volta_dl_ami" {
  owners = ["679593333241"]
  filter {
    name   = "name"
    values = ["NVIDIA Volta Deep Learning AMI*"]
  }
  most_recent = true
}

resource "aws_instance" "dl_instance" {
  ami           = "${data.aws_ami.nv_volta_dl_ami.id}"
  instance_type = "${var.instance-type}"
  tags {
    Name = "${var.name}"
  }
  root_block_device {
    volume_size = "${var.ebs-size}"
    volume_type = "gp2"
    delete_on_termination = true
  }
  key_name = "${var.key-name}"
  security_groups = ["${var.security-group}"]
}

output "id"         { value = "${aws_instance.dl_instance.id}" }
output "key-name"   { value = "${aws_instance.dl_instance.key_name}" }
output "public-dns" { value = "${aws_instance.dl_instance.public_dns}" }
output "ssh-cmd"    {
  value = "${format("ssh -i %s%s.pem ubuntu@%s", var.ssh-key-dir,
    aws_instance.dl_instance.key_name,
    aws_instance.dl_instance.public_dns)}"
}
