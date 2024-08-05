{ pkgs, ... }:

{
  home.packages = with pkgs.brewCasks; [
    firefox
    forklift
    geotag
    stats
    unnaturalscrollwheels
    rectangle

    # TODO:
    # chromium
    # dropbox
    # little-snitch
    # zoom
  ];
}
