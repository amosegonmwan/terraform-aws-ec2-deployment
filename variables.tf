variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "us-west-2"
}

variable "key_pair_name" {
  description = "Name of the key pair to use"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ec2-tag-name" {
  description = "EC2 instance tag name"
  default     = "ec2-web-server"
}

variable "sg-tag-name" {
  description = "Security group tag name"
  default     = "dev-web-sg"
}
