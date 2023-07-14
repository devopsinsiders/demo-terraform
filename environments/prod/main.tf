module "resource_group" {
  source                  = "../../modules/resource_group"
  resource_group_name     = "devopsinsiders-ecommerce-rg"
  resource_group_location = "West Europe"
}

module "storage_account" {
  depends_on               = [module.resource_group]
  source                   = "../../modules/storageaccount"
  storage_account_name     = "devopsinsidersstorage"
  resource_group_name      = module.resource_group.resource_group_name
  location                 = module.resource_group.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

module "sql_module" {
  depends_on                   = [module.resource_group]
  source                       = "../../modules/database"
  sql_server_name              = "devopsinsiderssqlserver"
  resource_group_name          = module.resource_group.resource_group_name
  location                     = module.resource_group.resource_group_location
  sql_version                  = "12.0"
  administrator_login          = "devopsinsiders"
  administrator_login_password = "P@ssw01rd@123"
  database_name                = "ecommerce_db"
  database_tags = {
    environment = "dev"
  }
}

module "aks_cluster" {
  depends_on          = [module.resource_group]
  source              = "../../modules/aks"
  cluster_name        = "devopsinsidersaks"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  dns_prefix          = "devopsinsidersaks"
  node_pool_name      = "default"
  node_pool_count     = 1
  node_pool_vm_size   = "Standard_D2_v2"
  identity_type       = "SystemAssigned"
}
