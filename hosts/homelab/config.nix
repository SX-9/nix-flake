{ ... }: {
  imports = [
    ../../modules/scans/homelab.nix
    ../../modules/hardware/homelab.nix
    
    ../../modules/system/server.nix
    ../../modules/system/user.nix
  ];
}
