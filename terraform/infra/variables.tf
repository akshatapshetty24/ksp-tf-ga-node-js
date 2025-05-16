variable "aws_region" {}
variable "cluster_name" {}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "node_instance_type" {
  default = "t3.medium"
}
variable "desired_capacity" {
  default = 2
}
variable "max_capacity" {
  default = 3
}
variable "min_capacity" {
  default = 1
}
variable "ecr-name" {
  default = "ksp-ecr-app-repository"
}
