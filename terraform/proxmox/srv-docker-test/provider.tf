terraform {
    required_version = ">= 0.13.0"
    required_providers {
        proxmox = {
            source = "Telmate/proxmox"
            version = "3.0.1-rc9"
        }
    }
}

provider "proxmox" {
    pm_api_url = var.pm_api_url
    pm_api_token_id = var.pm_user
    pm_api_token_secret = var.pm_pass
}