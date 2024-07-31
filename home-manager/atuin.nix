{ ... }:

{
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      filter_mode_shell_up_key_binding = "directory";
      dialect = "uk";
      enter_accept = true;
    };
  };
}
