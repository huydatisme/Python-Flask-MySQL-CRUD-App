terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
}

module "app_service_with_database" {
  source                               = "./module/app_service"
  resource_group                       = var.resource_group
  location                             = var.location
  app_service_plan                     = var.app_service_plan
  azurerm_app_service_name             = var.azurerm_app_service_name
  os_type                              = var.os_type
  python_version                       = var.python_version
  service_sku_name                     = var.service_sku_name
  token_type                           = var.token_type
  github_token                         = var.github_token
  repo_url                             = var.repo_url
  branch                               = var.branch
  runtime_stack                        = var.runtime_stack
  runtime_version                      = var.runtime_version
  azurerm_mysql_flexible_server_name   = var.azurerm_mysql_flexible_server_name
  administrator_login                  = var.administrator_login
  administrator_login_password         = var.administrator_login_password
  allow_app_service_name               = var.allow_app_service_name
  start_ip_address                     = var.start_ip_address
  end_ip_address                       = var.end_ip_address
  mysql_sku_name                       = var.mysql_sku_name
  azurerm_mysql_flexible_database_name = var.azurerm_mysql_flexible_database_name

}

