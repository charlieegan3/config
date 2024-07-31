{ config, pkgs, ... }:

{
  home.file = {
    "${config.home.homeDirectory}/.config/git/global-gitignore" = {
      text = builtins.readFile ./cfg/global-gitignore;
    };
    "${config.home.homeDirectory}/.config/git/gitmessage" = {
      text = builtins.readFile ./cfg/gitmessage;
    };
    "${config.home.homeDirectory}/.config/git/gitmessage-opa" = {
      text = builtins.readFile ./cfg/gitmessage-opa;
    };
  };

  programs.git = {
    enable = true;

    diff-so-fancy.enable = true;

    package = pkgs.gitAndTools.gitFull;

    userName = "Charlie Egan";
    userEmail = "charlieegan3@users.noreply.github.com";

    aliases = {
      s = "status -sb";
      c = "diff --cached";
      lg = "log --pretty=format:'%Cred%h%Creset %Cblue%an %Creset(%Cgreen%ar%Creset) \t%<(55,trunc)%s' --max-count=40";
      stash-all = "stash save --include-untracked";
      b = "branch --sort=-committerdate";
    };

    extraConfig = {
      core = {
        editor = "nvim";
        excludesfile = "${config.home.homeDirectory}/.config/git/global-gitignore";
        filemode = false;
      };
      color = {
        ui = "auto";
        status = {
          added = "green";
          changed = "blue bold";
          untracked = "red bold";
        };
      };
      commit = {
        template = "${config.home.homeDirectory}/.config/git/gitmessage";
        gpgsign = false;
      };

      push.default = "simple";
      init.defaultBranch = "main";

      filter.lfs = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };

      branch.autosetupmerge = "always";
      credential.helper = "store";
      fetch.fsckobjects = false;
      log.decorate = "full";
      rebase.autostash = true;
      stash.showPatch = true;
      status.showUntrackedFiles = "all";
      transfer.fsckobjects = true;
    };

    lfs.enable = true;
  };
}
