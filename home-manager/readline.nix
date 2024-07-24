{ ... }:

{
  programs.readline = {
    enable = true;

    includeSystemConfig = false;

    bindings = {
      "\\C-w" = "unix-word-rubout";
    };

    extraConfig = ''
      set completion-ignore-case on
    '';
  };
}
