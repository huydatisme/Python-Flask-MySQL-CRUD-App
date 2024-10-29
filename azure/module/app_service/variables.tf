variable "resource_group" {
  type    = string
  default = "flask_app"
}
variable "location" {
  type    = string
  default = "Canada Central"
}
variable "app_service_plan" {
  type    = string
  default = "app_plan1000"
}
variable "azurerm_app_service_name" {
  type    = string
  default = "webapp"
}
variable "service_sku_name" {
  type    = string
  default = ""
}
variable "service_sku_size" {
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
variable "azurerm_mysql_flexible_server_name" {
  type    = string
  default = ""
}
# variable "version" {
#   type    = number
#   default = 0
# }
variable "administrator_login" {
  type    = string
  default = ""
}
variable "administrator_login_password" {
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
variable "max_size_gb" {
  type    = number
  default = 0

}
variable "sql_command" {
  type    = string
  default = ""
}