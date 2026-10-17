variable "env" {
    description = "This is my environment for Infra"
    type = string
}

variable "bucket_name" {
    description = "This is my bucket name for Infra"
    type = string
}

variable "key_pair_name" {
    description = "This is my key pair for EC2  for Infra"
    type = string
}

variable "securiy_group_name" {
    description = "This is my security group for EC2  for Infra"
    type = string
}

variable "instance_count" {
    description = "This is my instance count for EC2  for Infra"
    type = number
}

variable "instance_type" {
    description = "This is my instance type for EC2  for Infra"
    type = string
}

variable "instance_ami_id" {
    description = "This is my instance type for EC2  for Infra"
    type = string
}

variable "ec2_default_root_storage_size" {
    description = "This is my instance type for EC2  for Infra"
    type = number
}


variable "dynamodb_hash_key" {
    description = "This is my instance type for EC2  for Infra"
    type = string
}