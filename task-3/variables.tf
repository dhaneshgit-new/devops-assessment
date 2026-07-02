variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "my_ip" {
  description = "Your IP address for SSH access, in CIDR form e.g. 1.2.3.4/32"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}