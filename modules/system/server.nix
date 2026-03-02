{ lib, ... }: {
  imports = [
    ./homelab/containers.nix
    ./homelab/movies.nix
    ./homelab/photos.nix
    ./homelab/share.nix
    ./homelab/proxy.nix
    ./homelab/auth.nix
    ./homelab/dash.nix
    ./homelab/dns.nix
    ./homelab/git.nix
    ./homelab/ai.nix
    ./base.nix
  ];
  
  virtualisation = {
    oci-containers.backend = "docker";
    docker = {
      enable = true;
      autoPrune.enable = true;
      enableOnBoot = true;
    };
  };

  networking = {
    networkmanager.dns = "none";
    nameservers = lib.mkForce [ "127.0.0.1" ];
  };
}