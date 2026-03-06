{ homelab, ... }: let
  app-url = "https://pass.proxy.${homelab.domain}";
in {
  services.vaultwarden = {
    enable = true;
    domain = app-url;
    backupDir = "/mnt/data/vaultwarden";
    config = {
      DOMAIN = app-url;
      ROCKET_PORT = 8060;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_LOG = "critical";
      SIGNUPS_ALLOWED = true;
    };
  };
}