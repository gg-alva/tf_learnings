terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
    backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "gautfstatestudent"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
variable "environment" {
  type        = string
  description = "The env type"
  default     = "staging"
}

locals {
  common_tags = {
    environment = var.environment
    lob   = "terraformfilestructure"
    stage = "alpha"
  }
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "India South Central"
}

resource "azurerm_storage_account" "example" {
  name                     = "gauravsto"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.common_tags.environment
  }
}
output "storage_account_name" {
  value = azurerm_storage_account.example.name
}
