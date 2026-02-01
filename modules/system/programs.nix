{ pkgs, ... }: {
  services = {
    sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
    printing = {
      enable = true;
      drivers = with pkgs; [ hplip ];
    };
  };

  programs = {
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
    zsh.enable = true;
    nix-ld.enable = true;
    steam.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    kdeconnect = {
      enable = true;
    };
  };
}