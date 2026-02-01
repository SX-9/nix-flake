{ pkgs, ... }:
{
  services = {
    thermald.enable = true;
    throttled.enable = true;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          energy_performance_preference = "balance_performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          energy_performance_preference = "balance_power";
          turbo = "never";
          enable_thresholds = "true";
          start_threshold = "80";
          stop_threshold = "85";
        };
      };
    };
    thinkfan = {
      enable = true;
      levels = [
        [ "level auto"       0  55  ]
        [ 3                  55 65  ]
        [ 7                  65 75  ]
        [ "level full-speed" 75 100 ]
      ];
      # sensors = [
      #   { type = "hwmon"; query = "/sys/devices/platform/coretemp.0/hwmon"; }
      # ];
    };
  };
}
