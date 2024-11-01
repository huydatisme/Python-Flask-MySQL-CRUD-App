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
variable "python_version" {
  type    = string
  default = ""

}
variable "service_sku_name" {
  type    = string
  default = ""
}
variable "sku_size" {
  type    = string
  default = ""
}
variable "repo_url" {
  type    = string
  default = ""
}
variable "os_type" {
  type    = string
  default = ""

}
variable "token_type" {
  type    = string
  default = ""

}
variable "github_token" {
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
variable "sql_command" {
  type    = string
  default = ""
}

variable "subscription_id" {
  type    = string
  default = ""
}
variable "client_id" {
  type    = string
  default = ""
}
variable "client_secret" {
  type    = string
  default = ""
}
variable "tenant_id" {
  type    = string
  default = ""
}

