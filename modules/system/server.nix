{ lib, ... }: {
  imports = [
    ./homelab/share.nix
    ./homelab/proxy.nix
    ./homelab/dash.nix
    ./homelab/dns.nix
    ./homelab/git.nix
    ./homelab/idp.nix
    ./base.nix
  ];
}