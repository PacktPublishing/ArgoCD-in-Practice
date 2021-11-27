variable "region" {
  default     = "us-east-1"
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC network"
  type        = string
}

variable "public_subnets" {
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  description = "The CIDR block for each public subnet"
  type        = list(string)
}

variable "private_subnets" {
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "The CIDR block for each private subnet"
  type        = list(string)
}

variable "cluster_name" {
  default     = "packt-cluster"
  description = "The name of EKS k8s cluster"
  type        = string
}

variable "domain" {
  default     = "packtargocdbook.link"
  description = "The domain name for Route53. Change it to use your own"
}

variable "zone_id" {
  default     = "Z06553931QSUA8NK1ZT1N"
  description = "The ID of Route53 hosted zone"
}

