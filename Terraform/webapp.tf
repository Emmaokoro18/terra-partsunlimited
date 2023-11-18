 terraform {
  required_version = ">= 0.11" 
 backend "azurerm" {
  resource_group_name  = "storage-RG"
  storage_account_name = "terrastoragebigee"
  container_name       = "terracontainer"
  key                  = "terraform.tfstate"
	}
	}
  provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "dev" {
  name     = "RG-terra"
  location = "East US"
}

resource "azurerm_app_service_plan" "dev" {
  name                = "plan-terra"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "dev" {
  name                = "emmaWebTerra"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  app_service_plan_id = "${azurerm_app_service_plan.dev.id}"

}
