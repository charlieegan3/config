{ pkgs, ... }:

{
  home.packages = with pkgs; [ fastgron ];

  programs.bash = {
    shellAliases = {
      gron = "fastgron";
    };
  };
}
