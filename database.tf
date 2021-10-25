data "oci_database_autonomous_databases" "olpt_autonomous_databases" {
  #Required
  compartment_id = var.compartment_ocid

  #Optional
  db_workload  = "OLTP"
  is_free_tier = "true"
}

resource "oci_database_autonomous_database" "olpt_autonomous_database" {
  #Required
  admin_password           = var.oltp_admin_password
  compartment_id           = var.compartment_ocid
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  db_name                  = "dbhr"

  #Optional
  db_workload  = "OLTP"

  is_auto_scaling_enabled = "false"
  license_model           = "LICENSE_INCLUDED"
  is_free_tier            = "true"
}

# resource "random_string" "olpt_autonomous_database_wallet_password" {
#   length  = 16
#   special = true
# }

# resource "oci_database_autonomous_database_wallet" "olpt_autonomous_database_wallet" {
#   autonomous_database_id = oci_database_autonomous_database.olpt_autonomous_database.id
#   password               = random_string.olpt_autonomous_database_wallet_password.result
#   base64_encode_content  = "true"
# }

# resource "local_file" "autonomous_data_warehouse_wallet_file" {
#   content_base64 = oci_database_autonomous_database_wallet.olpt_autonomous_database_wallet.content
#   filename       = "${path.module}/autonomous_data_warehouse_wallet.zip"
# }

# output "olpt_autonomous_database_wallet_password" {
#   value = random_string.olpt_autonomous_database_wallet_password.result
# }