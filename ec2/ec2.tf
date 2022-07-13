# ressource "iam" {
#     source = "../iam_creation"
# }

resource "aws_security_group" "security_group" {
  name = "terraform-ec2-sg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform test"
  }
}

resource "aws_security_group_rule" "ingress_rules" {

  count = length(var.sg_ingress_rules)

  type              = "ingress"
  from_port         = var.sg_ingress_rules[count.index].from_port
  to_port           = var.sg_ingress_rules[count.index].to_port
  protocol          = var.sg_ingress_rules[count.index].protocol
  cidr_blocks       = [var.sg_ingress_rules[count.index].cidr_block]
  security_group_id = aws_security_group.security_group.id
}

resource "aws_instance" "example" {
  
  ami           = "ami-0f8048fa3e3b9e8ff"
  instance_type = "t2.micro"
  key_name      = "Solana2Key"
  iam_instance_profile = var.iam_profile

  user_data = file("${path.module}/command.sh")

  tags = {
    Name = "ec2-test"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.security_group.id
  network_interface_id = aws_instance.example.primary_network_interface_id
}