{ pkgs, enable-dm, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = [ pkgs.libva-vdpau-driver ];
  };

  services = {
    displayManager.gdm.enable = enable-dm;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    blueman.enable = true;
    pulseaudio.enable = false;
  };

  security.rtkit.enable = true;
}