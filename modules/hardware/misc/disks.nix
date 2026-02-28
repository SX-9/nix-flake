{ homelab, ... }: {
  fileSystems = {
    "/mnt/share" = {
      device = homelab.disks.share;
      fsType = "ext4";
    };
    "/mnt/data" = {
      device = homelab.disks.data;
      fsType = "ext4";
    };
  };
}