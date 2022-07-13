variable "iam_profile" { }

variable "sg_ingress_rules" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = string
  }))
  default = [
    {
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      from_port  = 80
      to_port    = 80
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      from_port  = 443
      to_port    = 443
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
  ]
}
