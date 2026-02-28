{ ... }: {
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

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    cloudflare-warp.enable = true;
    resolved.enable = true;
  };
}
