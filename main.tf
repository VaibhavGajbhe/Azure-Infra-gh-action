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
  subscription_id = var.ARM_SUBSCRIPTION_ID
  tenant_id       = var.ARM_TENANT_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
}

resource "azurerm_resource_group" "rg1" {
  name     = "dev-tfstate-rg-01"
  location = "westus"
}
resource "azurerm_resource_group" "rg2" {
  name     = "dev-tfstate-rg-02"
  location = "westus"
}
