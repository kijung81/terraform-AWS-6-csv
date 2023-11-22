locals {
  sg_csv_list = csvdecode(file("./golfzon-sg-web.csv"))
}


resource "aws_security_group" "web" {
  name        = "web_sg"
  vpc_id      = aws_vpc.example.id
  tags = {
    Name = "${var.prefix}-web-sg"
  }
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_security_group_rule" "web_rule"{
  for_each = { for sg in local.sg_csv_list : sg.name => sg }
  type        = each.value.rule_type
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  cidr_blocks = [each.value.cidr]
  description = each.value.description
  security_group_id = aws_security_group.web.id
}