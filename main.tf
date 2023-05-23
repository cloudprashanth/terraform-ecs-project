
module "vpc" {
  source = "./modules/vpc"
  vpc_main_cidr = "10.0.0.0/18"
  instance_tenancy = "default"
}

module "ecs" {
  source = "./modules/ecs"
  td_role_arn = "${module.iam.td_role_arn}"
  public_subnets = "${module.vpc.public_subnets}"
  web_sg = "${module.vpc.web_sg}"
  frontend_tg = "${module.ec2.web_tg_arn}"
  frontend_port = 80
  elb_name = "${module.ec2.elb_name}"
  account_id = module.iam.account_id
}

module "iam" {
  source = "./modules/iam"
  region = var.region
}

module "dns" {
  source = "./modules/route53"
  dev-record-value = "54.237.243.174"
  elb_dns = module.ec2.elb_name
  elb_zone_id = module.ec2.elb_zone_id
}

module "ec2" {
  source = "./modules/ec2"
  public_subnets = "${module.vpc.public_subnets}"
  web_sg = "${module.vpc.web_sg}"
  main_vpc = "${module.vpc.main_vpc_id}"
}

module "ecr" {
  source = "./modules/ecr"
}