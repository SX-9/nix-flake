{ ... }: {
  services = {
    thermald.enable = false;
    throttled.enable = true;
    tlp = {
      enable = true;
      settings = {
        TLP_DEFAULT_MODE = "BAL";
        
        CPU_SCALING_GOVERNOR_ON_PRF = "performance";
        CPU_ENERGY_PERF_POLICY_ON_PRF = "performance";
        CPU_BOOST_ON_PRF = "1";
        PLATFORM_PROFILE_ON_PRF = "performance";
        
        CPU_SCALING_GOVERNOR_ON_BAL = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAL = "balance_power";
        CPU_BOOST_ON_BAL = "0";
        PLATFORM_PROFILE_ON_BAL = "balanced";
        
        CPU_SCALING_GOVERNOR_ON_SAV = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_SAV = "power";
        CPU_BOOST_ON_SAV = "0";
        CPU_MAX_FREQ_ON_SAV = "1200000";
        CPU_MIN_FREQ_ON_SAV = "400000";
        CPU_MIN_PERF_ON_SAV = "40";
        CPU_MAX_PERF_ON_SAV = "80";
        PLATFORM_PROFILE_ON_SAV = "low-power";
        MEM_SLEEP_ON_SAV = "deep";
        
        WOL_DISABLE = "N";
        DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth wwan";
        DEVICES_TO_ENABLE_ON_STARTUP = "wifi";
        
        START_CHARGE_THRESH_BAT0 = "80";
        STOP_CHARGE_THRESH_BAT0 = "85";
        
        START_CHARGE_THRESH_BAT1 = "80";
        STOP_CHARGE_THRESH_BAT1 = "85";
      };
    };
    auto-cpufreq = {
      enable = false; # replaced with tlp until fix: https://github.com/AdnanHodzic/auto-cpufreq/issues/906
      settings = {
        charger = {
          governor = "performance";
          energy_performance_preference = "performance";
          turbo = "auto";
        };
        battery = {
          governor = "powersave";
          energy_performance_preference = "power";
          turbo = "never";
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
    };
  };
}
