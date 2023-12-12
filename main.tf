module "vpc" {
  source = "./vpc"
}

module "network" {
  source = "./network"
  vpc_id = module.vpc.vpc_id 
}

module "iam" {
  source = "./iam"
}

module "compute" {
  source = "./compute"
  subnet_id             = module.network.public_subnet_id  
  service_account_email = module.iam.service_account_email 
}