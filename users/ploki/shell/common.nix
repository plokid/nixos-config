{ config, pkgs, lib, ... }:

let
  eza_params = "--git --icons --group --group-directories-first --time-style=long-iso --color-scale=all";
in
{
  programs = {
    eza.enable = true;
    fzf.enable = true;
    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };

    skim = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'eza --icons --git --color always -T -L 3 {} | head -200'"
        "--exact"
      ];
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      settings = {
        format = lib.strings.concatStrings [
          "[░▒▓](#a3aed2)"
          "[  ](bg:#a3aed2 fg:#090c0c)"
          "[](bg:#769ff0 fg:#a3aed2)"
          "$directory"
          "[](fg:#769ff0 bg:#394260)"
          "$git_branch"
          "$git_status"
          "[](fg:#394260 bg:#212736)"
          "$nodejs"
          "$rust"
          "$golang"
          "$php"
          "[](fg:#212736 bg:#1d2230)"
          "$time"
          "[ ](fg:#1d2230)"
          "\n$character"
        ];

        directory = {
          style = "fg:#e3e5e5 bg:#769ff0";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
          substitutions = {
            "Documents" = "󰈙 ";
            "Downloads" = " ";
            "Music" = " ";
            "Pictures" = " ";
          };
        };

        git_branch = {
          symbol = "";
          style = "bg:#394260";
          format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
        };

        git_status = {
          style = "bg:#394260";
          format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
        };

        nodejs = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };

        golang = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };

        php = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };

        time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format
          style = "bg:#1d2230";
          format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
        };
      };
    };
  };

  home.shellAliases = with lib;
    with pkgs; {
      ytmp3 = ''
        yt-dlp -x --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" --prefer-ffmpeg -o "%(title)s.%(ext)s"'';
      cat = "bat --style=plain";
      uuid = "cat /proc/sys/kernel/random/uuid";
      grep = "riprep";
      wget = "wget --hsts-file=\"${config.xdg.dataHome}/wget-hsts\"";
      fzf = "skim";
      untar = "tar -xvf";
      untargz = "tar -xzf";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      du = "du-ust";
      ps = "pros";
      m = "mkdir -p";
      fcd = "cd $(find -type d | fzf)";
      sc = "sudo systemctl";
      scu = "systemctl --user ";
      ls = "eza ${eza_params}";
      l = "eza --git-ignore ${eza_params}";
      ll = "eza --all --header --long ${eza_params}";
      llm = "eza --all --header --long --sort=modified ${eza_params}";
      la = "eza -lbhHigUmuSa";
      lx = "eza -lbhHigUmuSa@";
      lt = "eza --tree ${eza_params}";
      tree = "eza --tree ${eza_params}";
      kys = "shutdown now";
      gpl = "curl https://www.gnu.org/licenses/gpl-3.0.txt -o LICENSE";
      agpl = "curl https://www.gnu.org/licenses/agpl-3.0.txt -o LICENSE";
      webcam = "ffplay /dev/video0";
      g = "git";
      n = "nix";
      mnt = "udisksctl mount -b";
      umnt = "udisksctl unmount -b";
      burn = "pkill -9";
      diff = "diff --color=auto";
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
      "......" = "cd ../../../../../";
    };

  home.packages = with pkgs; [
    procs
    fd
    ripgrep
    du-dust
    bat
    trash-cli
    jq
  ];
}
