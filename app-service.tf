resource "azurerm_resource_group" "main" {
  name     = "${var.app-service-prefix}-resources"
  location = var.azure_location
}

resource "azurerm_app_service_plan" "main" {
  name                = "${var.app-service-prefix}-asp"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }
}

data "template_file" "docker_compose" {
  template = "${file("docker-compose.yml")}"
  vars = {
    db_connect_string = "${var.db_connect_string}"
    db_user           = "${var.db_user}"
    db_password       = "${var.db_password}"
  }
}

resource "azurerm_app_service" "main" {
  name                = "${var.app-service-prefix}-appservice"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id

  site_config {
    app_command_line = ""
    linux_fx_version = "COMPOSE|${base64encode("${data.template_file.docker_compose.rendered}")}"
    scm_type         = "GitHub"
    use_32_bit_worker_process = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}