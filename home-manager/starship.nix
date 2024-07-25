{ lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$character"
      ];
      directory = {
        style = "cyan";
        truncation_length = 3;
        truncation_symbol = "…/";
      };
      git_branch = {
        style = "bold purple";
        format = "[$branch(:$remote_branch)]($style) ";
      };
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
      scan_timeout = 10;
      add_newline = false;
    };
  };
}
