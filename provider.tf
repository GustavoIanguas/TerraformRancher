terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscriptionId
}

provider "helm"{
    kubernetes {
        config_paths = [
            "~/.kube/config"
        ]
    }
}

resource "azurerm_resource_group" "resoursegroup" {
  name = var.resourceGpDf
  location = var.locationDf
}