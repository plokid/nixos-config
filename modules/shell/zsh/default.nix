{ config
, lib
, pkgs
, ...
}:
let
  eza_params = "--git --icons --group --group-directories-first --time-style=long-iso --color-scale=all";
in
{
  programs = {
    eza.enable = true;
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

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "sudo"
        ];
      };

      shellAliases = with lib;
        with pkgs; {
          ytmp3 = ''
            ${getExe yt-dlp} -x --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" --prefer-ffmpeg -o "%(title)s.%(ext)s"'';
          cat = "${getExe bat} --style=plain";
          uuid = "cat /proc/sys/kernel/random/uuid";
          grep = getExe ripgrep;
          wget = "wget --hsts-file=\"${config.xdg.dataHome}/wget-hsts\"";
          fzf = getExe skim;
          untar = "tar -xvf";
          untargz = "tar -xzf";
          MANPAGER = "sh -c 'col -bx | bat -l man -p'";
          du = getExe du-dust;
          ps = getExe procs;
          m = "mkdir -p";
          fcd = "cd $(find -type d | fzf)";
          #l = "ls -lF --time-style=long-iso --icons";
          sc = "sudo systemctl";
          scu = "systemctl --user ";
          #la = "${getExe eza} -lah --tree";
          #ls = "${getExe eza} -h --git --icons --color=auto --group-directories-first -s extension";
          #tree = "${getExe eza} --tree --icons --tree";
          ls = "${getExe eza} ${eza_params}";
          l = "${getExe eza} --git-ignore ${eza_params}";
          ll = "${getExe eza} --all --header --long ${eza_params}";
          llm = "${getExe eza} --all --header --long --sort=modified ${eza_params}";
          la = "${getExe eza} -lbhHigUmuSa";
          lx = "${getExe eza} -lbhHigUmuSa@";
          lt = "${getExe eza} --tree ${eza_params}";
          tree = "${getExe eza} --tree ${eza_params}";
          kys = "shutdown now";
          gpl = "curl https://www.gnu.org/licenses/gpl-3.0.txt -o LICENSE";
          agpl = "curl https://www.gnu.org/licenses/agpl-3.0.txt -o LICENSE";
          webcam = "ffplay /dev/video0";
          deploy = "NIX_SSHOPTS=\" - p 2137 \" nixos-rebuild --target-host root@192.168.21.27 --flake .#prometheus switch";
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
    };
  };

  home.packages = with pkgs; [
    procs
    ripgrep
    du-dust
    bat
    yt-dlp
    fzf
    curl
    wget
    you-get
    trash-cli
    appimage-run
    p7zip
    zip
    unzip
    rar
  ];
}
