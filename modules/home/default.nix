{ username, ... }: {
  imports = [
    ./core/cli.nix
    ./core/zsh.nix
  ];

  home = {
    stateVersion = "24.11";
    username = "${username}";
    homeDirectory = "/home/${username}";
  };
}
