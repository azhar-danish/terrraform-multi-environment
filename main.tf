# dev-infrastructure
# module "dev-infra" {
#   source                        = "./infra-app"
#   env                           = "dev"
#   bucket_name                   = "infra-app-bucket-azhar"
#   key_pair_name                 = "my-app"
#   securiy_group_name            = "instance-SG"
#   instance_count                = 1
#   instance_type                 = "t2.micro"
#   instance_ami_id               = "ami-01a00762f46d584a1"
#   ec2_default_root_storage_size = 10
#   dynamodb_hash_key             = "studentID"
# }

# # staging-infrastructure
# module "stag-infra" {
#   source                        = "./infra-app"
#   env                           = "staging"
#   bucket_name                   = "infra-app-bucket-azhar"
#   key_pair_name                 = "my-app"
#   securiy_group_name            = "instance-SG"
#   instance_count                = 1
#   instance_type                 = "t2.medium"
#   instance_ami_id               = "ami-01a00762f46d584a1"
#   ec2_default_root_storage_size = 10
#   dynamodb_hash_key             = "studentID"
# }

# # prod-infrastructure
# module "prod-infra" {
#   source                        = "./infra-app"
#   env                           = "prod"
#   bucket_name                   = "infra-app-bucket-azhar"
#   key_pair_name                 = "my-app"
#   securiy_group_name            = "instance-SG"
#   instance_count                = 2
#   instance_type                 = "t2.small"
#   instance_ami_id               = "ami-01a00762f46d584a1"
#   ec2_default_root_storage_size = 20
#   dynamodb_hash_key             = "studentID"
# }

locals {
  env_config = {
    dev = {
      instance_count = 1
      instance_type = "t2.micro"
      ec2_default_root_storage_size = 10
    }
    stag = {
      instance_count = 1
      instance_type = "t2.medium"
      ec2_default_root_storage_size = 10
    }
    prod = {
      instance_count = 2
      instance_type = "t2.small"
      ec2_default_root_storage_size = 20
    }
  }

  current = local.env_config[terraform.workspace]
}

module "app-infra" {
  source                        = "./infra-app"
  env                           = terraform.workspace
  bucket_name                   = "${terraform.workspace}-infra-app-bucket-azhar"
  key_pair_name                 = "${terraform.workspace}-my-app"
  securiy_group_name            = "${terraform.workspace}-instance-SG"
  instance_count                = local.current.instance_count
  instance_type                 = local.current.instance_type
  instance_ami_id               = "ami-01a00762f46d584a1"
  ec2_default_root_storage_size = local.current.ec2_default_root_storage_size
  dynamodb_hash_key             = "studentID"
}


# for restoring tfstate file
# terraform import module.app-infra.aws_security_group.ec2_SG sg-09cd5d3ca97ef9236
# terraform import 'module.app-infra.aws_instance.my_instance[0]' i-0d7cf6090ded4299a
# terraform import 'module.app-infra.aws_key_pair.my_key' dev-my-app
# terraform import 'module.app-infra.aws_s3_bucket.my-bucket' dev-infra-app-bucket-azhar
# terraform import 'module.app-infra.aws_dynamodb_table.basic-dynamodb-table' dev-state_table
# terraform import 'module.app-infra.aws_default_vpc.default' vpc-04fd7332b52544cbe