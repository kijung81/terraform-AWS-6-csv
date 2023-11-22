variable "prefix" {
  default = "Terraform-PoC-6-sg-csv"
}
variable "region" {
  default = "ap-northeast-2"
}
# variable "vpc_id" {
#   default = "vpc-09cd62d218db5f3a5"
# }
# variable "subnet_id" {
#   default = "subnet-012d3f9fd2ab6b143"
# }
variable "instance_type" {
  default = "t2.micro"
}

variable vpc_cidr {
  default = "10.90.0.0/16"
}

variable pub_sbn_a {
  default = "10.90.1.0/24"
}

variable pub_sbn_b {
  default = "10.90.2.0/24"
}