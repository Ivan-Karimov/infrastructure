terraform {
  required_version = ">= 1.14.9, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.70.0, < 5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}
