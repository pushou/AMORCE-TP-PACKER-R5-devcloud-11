source "qemu" "qemu" {
    boot_command     = ["<esc><wait>", "auto ", "net.ifnames=0 ", "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian-12/preseed.cfg ", "<enter>"]
    boot_wait        = "15s"
    disk_size        = "${var.disk_size}"
    headless         = "${var.headless}"
    http_directory   = "http"
    iso_checksum     = "${var.iso_checksum_type}:${var.iso_checksum}"
    iso_url          = "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.1.0-amd64-netinst.iso"
    output_directory = "output-debian-12-amd64-small-qemu"
    qemuargs         = [["-m", "${var.memory}"], ["-smp", "${var.cpus}"]]
    shutdown_command = "sudo systemctl poweroff"
    ssh_password     = "vagrant"
    ssh_timeout      = "${var.ssh_timeout}"
    ssh_username     = "vagrant"
    vm_name          = "packer-debian-12-amd64-kvm-small"
}
