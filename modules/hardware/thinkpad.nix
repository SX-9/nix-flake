{ pkgs, ... }:
{
  imports = [
    ./tzupdate.nix
    ./hibernation.nix
    ./igpu.nix
    ./cpu-thermal.nix
    ./battery-power.nix
    ./power-button.nix
  ];

  security = {
    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
  };

  hardware = {
    enableRedistributableFirmware = true; # T480 WiFi firmware fix
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages;
    kernel.sysctl."vm.laptop_mode" = 5;
    initrd.availableKernelModules = [ "thinkpad_acpi" ];
  };

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
  };
}
