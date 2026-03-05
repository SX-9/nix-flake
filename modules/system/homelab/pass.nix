{ homelab, ... }: {
  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "pass.proxy.${homelab.domain}";
      SIGNUPS_ALLOWED = true;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8060;
      ROCKET_LOG = "critical";
    };
  };
}