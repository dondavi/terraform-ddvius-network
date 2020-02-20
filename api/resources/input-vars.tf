variable "region" {
   type=string
}
variable "profile" {
  type = "string"
  default = "" //must be empty string. included for debugging purposes
}
variable "credentials" {
  type="string"
  default="" //must be empty string. included for debugging purposes
}

variable "function_name" {
   type=string
}
variable "function_handler" {
   type=string
}

variable "function_path" {
    type=string
}

variable "stage_name" {
   type=string
}

variable "service_name" {
   type=string
}

variable "availability_zone" {
   type=string
}


variable "vpc_id" {
   type=string
}

variable "cert_arn" {
   type=string
}

variable "zone_id" {
   type=string
}

variable app_tag {
  type=string
}

variable owner_tag {
  type=string
}