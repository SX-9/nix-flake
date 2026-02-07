{ pkgs, wol, ... }: {
  boot = {
    kernelModules = [
      "rndis_host"
      "cdc_ether"
    ];
    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;
    };
  };

  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };

  systemd.services."wol" = {
    enable = wol != "";
    description = "Wake-on-LAN for ${wol}";
    requires = [ "network.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.ethtool}/bin/ethtool -s ${wol} wol g";
      Type = "oneshot";
    };
    wantedBy = [
      # just in case
      "multi-user.target"
      "sleep.target"
      "suspend.target"
      "hibernate.target"
      "hybrid-sleep.target"
      "shutdown.target"
      "reboot.target"
      "halt.target"
    ];
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    cloudflare-warp.enable = true;
    resolved.enable = true;
  };
}
