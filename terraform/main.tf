data "azurerm_client_config" "client_config" {}

resource "azurerm_resource_group" "web_store" {
  name     = "rg-web-store-dev-spc"
  location = "spaincentral"

  tags = {
    environment = "dev"
  }
}
