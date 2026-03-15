{ ... }: {
  imports = [
    ./core/firmware.nix
    ./core/igpu.nix
    ./misc/cpu-hotplug.nix
    ./misc/serial.nix
    ./misc/disks.nix
  ];
  
  boot.initrd.availableKernelModules = [
    "virtio_net"
    "virtio_pci"
    "virtio_mmio"
    "virtio_blk"
    "virtio_scsi"
    "virtio_console"
  ]; 
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
}
