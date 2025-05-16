terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.28.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dev-tfstate-rg"
    storage_account_name = "tfstatestorageacct001"
    container_name       = "devtfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  # subscription_id = var.subscription_id
  # tenant_id       = var.tenant_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # use_cli = false
}

resource "azurerm_resource_group" "rg1" {
  name     = "dev-tfstate-rg-01"
  location = "westus"
}
resource "azurerm_resource_group" "rg2" {
  name     = "dev-tfstate-rg-02"
  location = "westus"
}

resource "azurerm_resource_group" "rg3" {
  name     = "dev-hulk-rg"
  location = "westus"
}