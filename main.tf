resource "azurerm_api_management" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name = var.sku_name
  # notification_sender_email = var.notification_sender_email
  public_network_access_enabled = var.public_network_access_enabled
  virtual_network_type = var.virtual_network_type

  dynamic "virtual_network_configuration" {
    for_each = var.virtual_network_configuration ? [{}] : []
    content {
      subnet_id = var.subnet_id
    }
  }
}