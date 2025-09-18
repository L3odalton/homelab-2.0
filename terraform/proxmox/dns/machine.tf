resource "proxmox_vm_qemu" "srv-dns-01" {
    name = "srv-dns-01"
    target_node = "pve-ugreen-03"
    vmid = "50011"
    bios = "ovmf"
    onboot = true
    vm_state = "running"
    agent = 1
    clone_id = "7003"
    full_clone = true
    scsihw = "virtio-scsi-pci"
    memory = 2048
    balloon = 2048
    automatic_reboot = true
    os_type = "cloud-init"
    cicustom = "vendor=local:snippets/qemu-guest-agent.yml"
    ciuser = "mgrsys"
    ciupgrade = true
    searchdomain = "local.darksaber.fyi"
    nameserver = "10.0.50.12,1.1.1.1"
    ipconfig0 = "ip=10.0.50.11/24,gw=10.0.50.1"
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK43atgPI2XVBwvSM5hGhbeokxgKuetThnThHEJRMiAK
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFuOhwlgxLF/4v06qha9jPQ4egOaW2nUFlC7988tPh9X
    EOF

    cpu {
        cores = 2
        sockets = 1
        type = "x86-64-v3"
    }

    network {
        id = 0
        bridge = "vmbr0"
        model  = "virtio"
    }

    disks {
        scsi {
            scsi0 {
                disk {
                    storage = "local-zfs"
                    size    = "20G"
                    discard = "true"
                }
            }
        }
        ide {
            ide1 {
                cloudinit {
                    storage = "local-zfs"
                }
            }
        }
    }
}

resource "proxmox_vm_qemu" "srv-dns-02" {
    name = "srv-dns-02"
    target_node = "pve-s13-01"
    vmid = "50012"
    bios = "ovmf"
    onboot = true
    vm_state = "running"
    agent = 1
    clone_id = "7001"
    full_clone = true
    scsihw = "virtio-scsi-pci"
    memory = 2048
    balloon = 2048
    automatic_reboot = true
    os_type = "cloud-init"
    cicustom = "vendor=local:snippets/qemu-guest-agent.yml"
    ciuser = "mgrsys"
    ciupgrade = true
    searchdomain = "local.darksaber.fyi"
    nameserver = "10.0.50.11,1.1.1.1"
    ipconfig0 = "ip=10.0.50.12/24,gw=10.0.50.1"
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK43atgPI2XVBwvSM5hGhbeokxgKuetThnThHEJRMiAK
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFuOhwlgxLF/4v06qha9jPQ4egOaW2nUFlC7988tPh9X
    EOF

    cpu {
        cores = 2
        sockets = 1
        type = "x86-64-v3"
    }

    network {
        id = 0
        bridge = "vmbr0"
        model  = "virtio"
    }

    disks {
        scsi {
            scsi0 {
                disk {
                    storage = "local-zfs"
                    size    = "20G"
                    discard = "true"
                }
            }
        }
        ide {
            ide1 {
                cloudinit {
                    storage = "local-zfs"
                }
            }
        }
    }
}
