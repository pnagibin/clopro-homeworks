variable "name" {
  type = string
}

variable "k8s_release" {
  type    = string
  default = "STABLE"

  validation {
    #condition     = var.k8s_release == "STABLE" || var.k8s_release == "REGULAR" || var.k8s_release == "RAPID"
    condition     = contains(["STABLE", "REGULAR", "RAPID"], var.k8s_release)
    error_message = "Release only STABLE or REGULAR or STABLE."
  }
}

variable "k8s_version" {
  default = "1.21"
  type    = string
}

variable "network" {
}

variable "instance_service" {
}

variable "instance_node" {
}

variable "sa_service" {
}

variable "sa_node" {
}

variable "kms" {
}