{ hostname, timezone, ... }: {
  system.stateVersion = "24.11";
  imports = [
    ./misc/utilities.nix
    ./misc/nix-conf.nix
  ];

  networking.hostName = "${hostname}";
  time.timeZone = timezone;
  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };
}
