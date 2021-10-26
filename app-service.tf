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