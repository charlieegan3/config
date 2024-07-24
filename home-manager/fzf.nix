{ ... }:

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = false;
    defaultCommand = ''
      rg --files --hidden --glob "!vendor*" --glob "!.git/*"
    '';
  };
}
