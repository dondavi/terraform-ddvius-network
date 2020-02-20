
variable "region" {
  type=string
}

variable "profile" {
  type    = string
  default = "" //must be empty string. included for debugging purposes
}

variable "credentials" {
  type    = string
  default = "" //must be empty string. included for debugging purposes
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet1_id" {
  type = string
}

variable "private_subnet2_id" {
  type = string
}

variable "private_subnet3_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "app_tag" {
  type = string
}

variable "owner_tag" {
  type = string
}

