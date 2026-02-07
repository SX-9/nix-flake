{ ... }: {
  imports = [
    ../../modules/scans/thinkpad.nix
    
    ../../modules/hardware/thinkpad.nix
    ../../modules/system/default.nix
    ../../modules/system/user.nix
  ];
}
