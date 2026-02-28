{ username, ... }: {
  imports = [
    ./core/apps.nix
    ./core/cli.nix
    ./core/zsh.nix
  ];

  home = {
    stateVersion = "24.11";
    username = "${username}";
    homeDirectory = "/home/${username}";
  };
}
