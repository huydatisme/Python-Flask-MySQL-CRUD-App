

locals {
  resource_group = var.resource_group
  location       = var.location
}


resource "azurerm_resource_group" "flask_app" {
  name     = local.resource_group
  location = local.location
}

resource "azurerm_service_plan" "app_plan1000" {
  name                = var.app_service_plan
  location            = azurerm_resource_group.flask_app.location
  resource_group_name = azurerm_resource_group.flask_app.name

  os_type  = var.os_type
  sku_name = var.service_sku_name
}

resource "azurerm_app_service" "webapp" {
  name                = var.azurerm_app_service_name
  location            = azurerm_resource_group.flask_app.location
  resource_group_name = azurerm_resource_group.flask_app.name
  app_service_plan_id = azurerm_service_plan.app_plan1000.id
  source_control {
    repo_url           = var.repo_url
    branch             = var.branch
    manual_integration = true
    use_mercurial      = false
  }
  depends_on = [azurerm_service_plan.app_plan1000]
}

resource "azurerm_mysql_flexible_server" "flaskapp-server" {
  name                   = var.azurerm_mysql_flexible_server_name
  resource_group_name    = azurerm_resource_group.flask_app.name
  location               = azurerm_resource_group.flask_app.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_login_password
  sku_name               = var.mysql_sku_name
}

resource "azurerm_mysql_flexible_database" "flaskapp-db" {
  name                = var.azurerm_mysql_flexible_database_name
  resource_group_name = azurerm_resource_group.flask_app.name
  server_name         = azurerm_mysql_flexible_server.flaskapp-server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}