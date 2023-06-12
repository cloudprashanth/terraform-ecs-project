variable "project_name" {
  default = "pg"
}

variable "td_role_arn" {

}

variable "public_subnets" {
  type = list(string)
}

variable "web_sg" {

}

variable "frontend_tg" {

}

variable "frontend_port" {

}

variable "elb_name" {

}

variable "account_id" {

}

variable "frontend_log_group_name" {

}

variable "log_stream_prefix" {
  default = "ecs"
}
