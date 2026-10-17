# dev-infrastructure
module "dev-infra" {
  source                        = "./infra-app"
  env                           = "dev"
  bucket_name                   = "infra-app-bucket-azhar"
  key_pair_name                 = "my-app"
  securiy_group_name            = "instance-SG"
  instance_count                = 1
  instance_type                 = "t2.micro"
  instance_ami_id               = "ami-01a00762f46d584a1"
  ec2_default_root_storage_size = 10
  dynamodb_hash_key             = "studentID"
}

# staging-infrastructure
module "stag-infra" {
  source                        = "./infra-app"
  env                           = "staging"
  bucket_name                   = "infra-app-bucket-azhar"
  key_pair_name                 = "my-app"
  securiy_group_name            = "instance-SG"
  instance_count                = 1
  instance_type                 = "t2.medium"
  instance_ami_id               = "ami-01a00762f46d584a1"
  ec2_default_root_storage_size = 10
  dynamodb_hash_key             = "studentID"
}

# prod-infrastructure
module "prod-infra" {
  source                        = "./infra-app"
  env                           = "prod"
  bucket_name                   = "infra-app-bucket-azhar"
  key_pair_name                 = "my-app"
  securiy_group_name            = "instance-SG"
  instance_count                = 2
  instance_type                 = "t2.small"
  instance_ami_id               = "ami-01a00762f46d584a1"
  ec2_default_root_storage_size = 20
  dynamodb_hash_key             = "studentID"
}