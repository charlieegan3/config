{ pkgs, ... }:

{
  home.packages = with pkgs.brewCasks; [
    firefox
    forklift
    geotag
    stats
    unnaturalscrollwheels

    # TODO:
    # chromium
    # dropbox
    # little-snitch
    # zoom
  ];
}
