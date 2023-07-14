variable "sql_server_name" {
  description = "Name of the SQL server"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the SQL server and database"
  type        = string
}

variable "sql_version" {
  description = "Version of the SQL server"
  type        = string
}

variable "administrator_login" {
  description = "Administrator login for the SQL server"
  type        = string
}

variable "administrator_login_password" {
  description = "Administrator login password for the SQL server"
  type        = string
}

variable "database_name" {
  description = "Name of the SQL database"
  type        = string
}

variable "database_tags" {
  description = "Tags for the SQL database"
  type        = map(string)
  default     = {
    environment = "production"
  }
}
