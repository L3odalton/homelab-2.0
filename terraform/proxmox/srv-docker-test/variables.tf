variable "pm_api_url" {
    type = string
    description = "The Proxmox API URL"
}

variable "pm_user" {
    type = string
    description = "The Proxmox API token ID"
    sensitive = true
}

variable "pm_pass" {
    type = string
    description = "The Proxmox API token secret"
    sensitive = true
}