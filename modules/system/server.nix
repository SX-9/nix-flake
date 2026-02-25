{ ... }: {
  imports = [
    ./homelab/share.nix
    ./homelab/dns.nix
    ./base.nix
  ];

  services.openssh.enable = true;
}