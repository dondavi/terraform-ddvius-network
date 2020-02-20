variable "region" {
   type="string"
}

variable "profile" {
  type = "string"
  default = "" //must be empty string. included for debugging purposes
}
variable "credentials" {
  type="string"
  default="" //must be empty string. included for debugging purposes
}

variable "app_tag" {
  type = string
}

variable "owner_tag" {
  type = string
}

variable "cert_domain" {
  type=string
}

variable "vpc_cidr" {
  type=string
}

variable "domain" {
  type=string
}

variable "availzone_1" {
  type=string
}
variable "availzone_2" {
  type=string
}
variable "availzone_3" {
  type=string
}

variable "public_subnet1_cidr" {
  type=string
}

variable "public_subnet2_cidr" {
  type=string
}

variable "public_subnet3_cidr" {
  type=string
}

variable "private_subnet1_cidr" {
  type=string
}

variable "private_subnet2_cidr" {
  type=string
}

variable "private_subnet3_cidr" {
  type=string
}
