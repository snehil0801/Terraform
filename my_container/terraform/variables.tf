variable "prefix" {
  description = "prefix that I am going to use for all resources"
  default     = "snehil"
}

output "prefix_out" {
  value = var.prefix
}
