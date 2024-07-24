{ ... }:

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    defaultCommand = ''
      rg --files --hidden --glob "!vendor*" --glob "!.git/*"
    '';
  };
}
