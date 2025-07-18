resource "proxmox_vm_qemu" "srv-swrm-mgr" {
    name = "srv-swrm-mgr"
    target_node = "pve-s13-01"
    vmid = "100141"
    bios = "ovmf"
    onboot = true
    vm_state = "running"
    agent = 1
    clone_id = "7001"
    full_clone = true
    scsihw = "virtio-scsi-pci"
    memory = 2048
    automatic_reboot = true

    os_type = "cloud-init"
    cicustom = "vendor=local:snippets/qemu-guest-agent.yml"
    ciuser = "mgrsys"
    ciupgrade = true
    searchdomain = "local.darksaber.fyi"
    nameserver = "10.0.100.253,10.0.100.254"
    ipconfig0 = "ip=10.0.100.141/24,gw=10.0.100.1"
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

resource "proxmox_vm_qemu" "srv-swrm-wrk-01" {
    name = "srv-swrm-wrk-01"
    target_node = "pve-s13-02"
    vmid = "100142"
    bios = "ovmf"
    onboot = true
    vm_state = "running"
    agent = 1
    clone_id = "7002"
    full_clone = true
    scsihw = "virtio-scsi-pci"
    memory = 4096
    automatic_reboot = true

    os_type = "cloud-init"
    cicustom = "vendor=local:snippets/qemu-guest-agent.yml"
    ciuser = "mgrsys"
    ciupgrade = true
    searchdomain = "local.darksaber.fyi"
    nameserver = "10.0.100.253,10.0.100.254"
    ipconfig0 = "ip=10.0.100.142/24,gw=10.0.100.1"
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
                    size    = "50G"
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

resource "proxmox_vm_qemu" "srv-swrm-wrk-02" {
    name = "srv-swrm-wrk-02"
    target_node = "pve-ugreen-03"
    vmid = "100143"
    bios = "ovmf"
    onboot = true
    vm_state = "running"
    agent = 1
    clone_id = "7003"
    full_clone = true
    scsihw = "virtio-scsi-pci"
    memory = 4096
    automatic_reboot = true

    os_type = "cloud-init"
    cicustom = "vendor=local:snippets/qemu-guest-agent.yml"
    ciuser = "mgrsys"
    ciupgrade = true
    searchdomain = "local.darksaber.fyi"
    nameserver = "10.0.100.253,10.0.100.254"
    ipconfig0 = "ip=10.0.100.143/24,gw=10.0.100.1"
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
                    size    = "50G"
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