data "alicloud_mongodb_instances" "this" {
  ids = var.existing_instance_id != "" ? [var.existing_instance_id] : null
}
locals {
  this_mongodb_instance_engine_version = var.existing_instance_id != "" ? concat(data.alicloud_mongodb_instances.this.instances.*.engine_version, [""])[0] : concat(alicloud_mongodb_instance.this.*.engine_version, [""])[0]
  this_db_instance_class               = var.existing_instance_id != "" ? concat(data.alicloud_mongodb_instances.this.instances.*.instance_class, [""])[0] : concat(alicloud_mongodb_instance.this.*.db_instance_class, [""])[0]
  this_db_instance_storage             = var.existing_instance_id != "" ? concat(data.alicloud_mongodb_instances.this.instances.*.storage, [0])[0] : concat(alicloud_mongodb_instance.this.*.db_instance_storage, [""])[0]
  this_mongodb_instance_charge_type    = var.existing_instance_id != "" ? concat(data.alicloud_mongodb_instances.this.instances.*.charge_type, [""])[0] : concat(alicloud_mongodb_instance.this.*.instance_charge_type, [""])[0]
  this_db_instance_name                = var.existing_instance_id != "" ? concat(data.alicloud_mongodb_instances.this.instances.*.name, [""])[0] : concat(alicloud_mongodb_instance.this.*.name, [""])[0]
  this_db_instance_zone_id             = var.existing_instance_id != "" ? concat(data.alicloud_mongodb_instances.this.instances.*.availability_zone, [""])[0] : concat(alicloud_mongodb_instance.this.*.zone_id, [""])[0]
}
#################
# MongoDB Instance
#################
output "this_mongodb_instance_id" {
  description = "The ID of the MongoDB instance. "
  value       = local.this_instance_id
}

output "this_mongodb_instance_name" {
  description = "The name of MongoDB instance. "
  value       = local.this_db_instance_name
}
