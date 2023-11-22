data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_subnet" "default" {
  id = var.subnet_id
}

resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnet.default.id
  vpc_security_group_ids = [data.terraform_remote_state.sg_csv.outputs.sg_id]
  associate_public_ip_address = true
  key_name      = var.ec2_key
  tags = {
    Name = "${var.prefix}-web1"
  }
}