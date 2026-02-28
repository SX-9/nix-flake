{ pkgs, wol, ... }: {
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
}