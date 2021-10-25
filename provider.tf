# ------ Initialize Oracle Terraform provider
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key      = var.private_key_path
  region           = var.region
}

# ------ Initialize Azure Terraform provider
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}