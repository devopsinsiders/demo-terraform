variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Location of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the default node pool"
  type        = string
}

variable "node_pool_count" {
  description = "Number of nodes in the default node pool"
  type        = number
}

variable "node_pool_vm_size" {
  description = "VM size for the default node pool"
  type        = string
}

variable "identity_type" {
  description = "Type of managed identity for the AKS cluster"
  type        = string
}
