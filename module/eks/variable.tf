variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the EKS cluster will be launched"
  type        = list(string)
}
variable "environment" {
  description = "The environment (e.g., dev, stage, prod)"
}

variable "product_name" {
  description = "The name of the product (e.g., devopsofworld)"
}


variable "node_group_name" {
  description = "Name of the EKS node group."
}

variable "node_group_desired_size" {
  description = "Desired size of the node group."
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "Maximum size of the node group."
  type        = number
  default     = 2
}

variable "node_group_min_size" {
  description = "Minimum size of the node group."
  type        = number
  default     = 1
}
# variable "eks_instance_type" {
#   description = "The Instance type of Node group" 
# }