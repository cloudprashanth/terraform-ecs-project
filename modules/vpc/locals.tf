locals {
  az_names    = "${data.aws_availability_zones.azs.names}"
  pub_sub_ids = "${aws_subnet.public.*.id}"
}

locals {
  env = "${terraform.workspace}"
  project_name = var.project_name
}