{ ... }:

{
  programs.yazi = {
    enable = true;
  };
  programs.bash = {
    # func to cd to the directory yazi has open
    # https://yazi-rs.github.io/docs/quick-start/#shell-wrapper
    profileExtra = ''
      function yy() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
  };
}
