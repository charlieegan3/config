# config

My home-manager config repo. Untested init instructions:

```sh
mkdir -p ~/.config/
git clone https://github.com/charlieegan3/config ~/.config/
nix run home-manager/master -- init
nix run home-manager/master -- init --switch
```
