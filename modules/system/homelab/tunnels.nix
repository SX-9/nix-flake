{ homelab, ... }: {
  services.cloudflared = {
    enable = true;
    tunnels.homelab = {
      credentialsFile = "/mnt/data/cloudflared/homelab.json";
      default = "http_status:404";
      ingress = {
        "git.${homelab.domain}" = "http://localhost:3000";
        "auth.${homelab.domain}" = "http://localhost:1411";
        "gallery.${homelab.domain}" = "http://localhost:2284";
      };
    };
  };
}