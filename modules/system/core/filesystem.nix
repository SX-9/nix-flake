{ ... }: {
  services.fstrim.enable = true;
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "vfat"
    "ntfs"
    "exfat"
  ];
}