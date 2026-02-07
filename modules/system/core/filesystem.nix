{ swapfile, ... }:
{
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "vfat"
    "ntfs"
    "exfat"
  ];

  swapDevices =
    if swapfile == 0 then
      [ ]
    else
      [
        {
          device = "/swapfile";
          size = swapfile;
        }
      ];
      
  services.fstrim.enable = true;
}