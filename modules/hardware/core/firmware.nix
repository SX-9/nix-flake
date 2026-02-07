{ ... }: {
  hardware.enableRedistributableFirmware = true; # T480 WiFi firmware fix
  services.fwupd.enable = true;
}