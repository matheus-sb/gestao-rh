############################
#  OCI Tenancy Credentials #
############################

variable "tenancy_ocid" {
  description = "User Tenancy OCID"
}

variable "user_ocid" {
  description = "User OCID"
}

variable "fingerprint" {
   description = "User Private Key Fingerprint"
}

variable "private_key_path" {
  description = "User Private Key Path"
}

variable "region" {
  description = "User Region Value"
}

variable "compartment_ocid" {
  description = "User Compartment OCID"
}

############################
#  OCI autonomous database #
############################

variable "oltp_admin_password" {
  description = "autonomous data admin password OCI"
}

############################
# Azure Credentials #
############################

variable "azure_subscription_id" {
  description = "Azure subscription identity"
}

variable "client_id" {
  description = "Azure client id"
}

variable "client_secret" {
  description = "Azure client secret"
}

variable "tenant_id" {
  description = "Azure tenant id"
}

############################
# Azure App Service #
############################

variable "azure_location" {
  default = "Central US"
}

variable "app-service-prefix" {
  description = "Used to create group, plan, and app service with this prefix"
  default = "gestaorh2"
}

variable "db_connect_string" {
  description = "Database connection string"
}

variable "db_user" {
  description = "Database user"
}

variable "db_password" {
  description = "Database password"
}