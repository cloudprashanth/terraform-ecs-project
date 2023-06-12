variable "web_sg" {

}

variable "project_name" {
  description = "Name of the Project"
  default     = "pg"
}

variable "public_subnets" {
  type = list(string)
}

variable "main_vpc" {

}

variable "health_check_path" {
  default = "/"
}
