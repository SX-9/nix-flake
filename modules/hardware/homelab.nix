{ ... }: {
  imports = [
    ./core/firmware.nix
    ./core/igpu.nix
    ./core/tpm.nix
    ./misc/disks.nix
  ];
  
  boot.initrd.availableKernelModules = [ "virtio_net" "virtio_pci" "virtio_mmio" "virtio_blk" "virtio_scsi" "virtio_console" ]; 
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
}
