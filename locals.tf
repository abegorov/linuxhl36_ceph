locals {
  yandex_compute_instance_mon_count = 3
  yandex_compute_instance_mds_count = 2
  yandex_compute_instance_metadata = {
    install-unified-agent = 0
    serial-port-enable    = 0
    user-data = templatefile("${path.module}/cloud-config.tftpl", {
      username   = var.ssh_username,
      public_key = file(format("%s.pub", var.ssh_key_file))
    })
  }
}
