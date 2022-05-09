module "networking" {
  source = "./networking"
}

module "compute" {
  source            = "./compute"
  security_group_id = [module.networking.security_group_id]
  subnet_id         = module.networking.subnet_id
  host_os           = var.host_os
  node_name         = "main"
  key_name          = "main-key"
  instance_type     = "t2.micro"
}

module "derek-dev" {
  source            = "./compute"
  security_group_id = [module.networking.security_group_id]
  subnet_id         = module.networking.subnet_id
  host_os           = "linux"
  node_name         = "derek"
  key_name          = "derek-key"
  instance_type     = "t2.micro"
}