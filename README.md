# config

My home-manager config repo. Untested init instructions:

```sh
# install nix, then
mkdir -p ~/.config/
git clone https://github.com/charlieegan3/config ~/.config/
nix run home-manager/master -- init --switch -b backup
```

Notes:

* Might need to `tmux kill-server` to enable the config reloading.
* Might need to copy the Nix config into the `~/.config/nix/` dir
  to enable the use of flakes.

