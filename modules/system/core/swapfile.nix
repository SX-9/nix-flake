{ swapfile, ... }: {
  swapDevices = if swapfile == 0 then [] else [{
    device = "/swapfile";
    size = swapfile;
  }];
}