{ pkgs, legacy-boot, ... }: {
  boot = {
    plymouth.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = !legacy-boot;
        configurationLimit = 3;
        sortKey = "z-nixos";
        editor = false;
      };
      grub = {
        enable = legacy-boot;
        device = "/dev/sda";
        useOSProber = true;
        default = "saved";
        theme = "${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze";
      };
    };
  };
}