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

resource "azurerm_linux_web_app" "flaskapp" {
  name                = var.azurerm_app_service_name
  resource_group_name = azurerm_resource_group.flask_app.name
  location            = azurerm_resource_group.flask_app.location
  service_plan_id     = azurerm_service_plan.app_plan1000.id
  depends_on          = [azurerm_service_plan.app_plan1000]
  site_config {
    application_stack {
      python_version = var.python_version
    }
  }
  app_settings = {
    DATABASE_URL = "mysql://${var.administrator_login}:${
    var.administrator_login_password}@${azurerm_mysql_flexible_server.flaskapp-server.fqdn}:3306/${azurerm_mysql_flexible_database.flaskapp-db.name}"
  }
}

resource "azurerm_source_control_token" "github" {
  type  = var.token_type
  token = var.github_token
}

resource "azurerm_app_service_source_control" "flaskapp" {
  app_id   = azurerm_linux_web_app.flaskapp.id
  repo_url = var.repo_url
  branch   = var.branch
  github_action_configuration {
    code_configuration {
      runtime_stack   = var.runtime_stack
      runtime_version = var.runtime_version

    }

    generate_workflow_file = true

  }

}


resource "azurerm_mysql_flexible_server" "flaskapp-server" {
  name                   = var.azurerm_mysql_flexible_server_name
  resource_group_name    = azurerm_resource_group.flask_app.name
  location               = azurerm_resource_group.flask_app.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_login_password
  sku_name               = var.mysql_sku_name
}

resource "azurerm_mysql_flexible_server_firewall_rule" "allow_app_service" {
  name                = var.allow_app_service_name
  resource_group_name = azurerm_resource_group.flask_app.name
  server_name         = azurerm_mysql_flexible_server.flaskapp-server.name
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}

resource "azurerm_mysql_flexible_database" "flaskapp-db" {
  name                = var.azurerm_mysql_flexible_database_name
  resource_group_name = azurerm_resource_group.flask_app.name
  server_name         = azurerm_mysql_flexible_server.flaskapp-server.name
  charset             = var.charset
  collation           = var.collation
}

#disable cert to access DB
resource "azurerm_mysql_flexible_server_configuration" "disable_secure_transport" {
  name                = "require_secure_transport"
  resource_group_name = azurerm_resource_group.flask_app.name
  server_name         = azurerm_mysql_flexible_server.flaskapp-server.name
  value               = "OFF"
}

resource "null_resource" "initialize_db" {
  provisioner "local-exec" {
    command = <<EOT
      mysql -h ${azurerm_mysql_flexible_server.flaskapp-server.fqdn} \
            -u ${var.administrator_login}@${azurerm_mysql_flexible_server.flaskapp-server.name} \
            -p${var.administrator_login_password} \
            -D ${azurerm_mysql_flexible_database.flaskapp-db.name} < init.sql
    EOT
  }

  depends_on = [azurerm_mysql_flexible_server.flaskapp-server, azurerm_mysql_flexible_database.flaskapp-db, azurerm_mysql_flexible_server_firewall_rule.allow_app_service]
}

