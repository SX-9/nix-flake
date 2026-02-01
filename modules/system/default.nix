{ pkgs, locale, ... }: {
  imports = [
    ./base.nix
    ./network.nix
    ./user.nix
    ./kernel.nix
    ./bootloader.nix
    ./filesystem.nix
    ./virtualization.nix
    ./desktop.nix
    ./programs.nix
  ];

  i18n.defaultLocale = locale;
  environment.localBinInPath = true;

  security = {
    sudo.configFile = ''
      Defaults insults
      Defaults passwd_tries = 5
    '';
  };

  fonts.packages = with pkgs; [
    corefonts
  ];
}