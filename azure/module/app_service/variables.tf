variable "resource_group" {
  type    = string
  default = ""
}
variable "location" {
  type    = string
  default = ""
}
variable "app_service_plan" {
  type    = string
  default = ""
}
variable "azurerm_app_service_name" {
  type    = string
  default = ""
}
variable "service_sku_name" {
  type    = string
  default = ""
}
variable "service_sku_size" {
  type    = string
  default = ""
}
variable "token_type" {
  type    = string
  default = ""
}
variable "python_version" {
  type    = string
  default = ""
}
variable "github_token" {
  type    = string
  default = ""
}
variable "os_type" {
  type    = string
  default = ""

}
variable "repo_url" {
  type    = string
  default = ""
}
variable "branch" {
  type    = string
  default = ""
}
variable "runtime_stack" {
  type    = string
  default = ""

}
variable "runtime_version" {
  type    = string
  default = ""

}
variable "azurerm_mysql_flexible_server_name" {
  type    = string
  default = ""
}

variable "administrator_login" {
  type    = string
  default = ""
}
variable "administrator_login_password" {
  type    = string
  default = ""
}
variable "allow_app_service_name" {
  type    = string
  default = ""

}
variable "start_ip_address" {
  type    = string
  default = ""

}
variable "end_ip_address" {
  type    = string
  default = ""

}
variable "mysql_sku_name" {
  type    = string
  default = ""
}
variable "azurerm_mysql_flexible_database_name" {
  type    = string
  default = ""
}
variable "charset" {
  type    = string
  default = "utf8"
}
variable "collation" {
  type    = string
  default = "utf8_general_ci"
}

