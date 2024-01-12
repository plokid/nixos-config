{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions;
      [
        ms-ceintl.vscode-language-pack-zh-hans
        vscodevim.vim
        ms-vscode.cpptools
        ms-python.python
        dotjoshjohnson.xml
        eamodio.gitlens
        editorconfig.editorconfig
        esbenp.prettier-vscode
        file-icons.file-icons
        github.vscode-pull-request-github
        jnoortheen.nix-ide
        kamadorueda.alejandra
        ms-vscode-remote.remote-ssh
        ms-vscode.cpptools
        redhat.java
        redhat.vscode-yaml
        yzhang.markdown-all-in-one
        rust-lang.rust-analyzer
        james-yu.latex-workshop
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "multi-command";
          publisher = "ryuta46";
          version = "1.6.0";
          sha256 = "AnHN1wvyVrZRlnOgxBK7xKLcL7SlAEKDcw6lEf+2J2E=";
        }
        {
          name = "better-comments";
          publisher = "aaron-bond";
          version = "3.0.2";
          sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
        }
        {
          name = "vscode-html-css";
          publisher = "ecmel";
          version = "1.13.1";
          sha256 = "sha256-gBfcizgn+thCqpTa8bubh6S77ynBC/Vpc+7n4XOfqzE=";
        }
        {
          name = "vscode-office";
          publisher = "cweijan";
          version = "3.1.8";
          sha256 = "LDX9zlMnXqfQz9MUWoFdgd8W3GyjY5X8k+zdxpHJqjQ=";
        }
        {
          name = "vscode-drawio";
          publisher = "hediet";
          version = "1.6.6";
          sha256 = "SPcSnS7LnRL5gdiJIVsFaN7eccrUHSj9uQYIQZllm0M=";
        }
      ];
    userSettings = {
      "editor.fontSize" = 16;
      "editor.fontFamily" = "'Fira Code', 'monospace', monospace, 'MesloLGS NF'";
      "window.zoomLevel" = 1.5;
      "terminal.integrated.fontSize" = 16;
      "files.autoSave" = "afterDelay";
      "hediet.vscode-drawio.resizeImage" = "null";
      "explorer.confirmDragAndDrop" = false;
      "multiCommand.commands" = [
        {
          "command" = "multiCommand.multiEscape";
          "sequence" = [
            "workbench.action.focusFirstEditorGroup"
            "extension.vim_escape"
            "closeFindWidget"
            "hideSuggestWidget"
            "notifications.clearAll"
          ];
        }
      ];
      "vim.leader" = " ";
      "vim.easymotion" = true;
      "vim.easymotionKeys" = "hklyuiopnm,qwertzxcvbasdgjf;";
      "vim.easymotionJumpToAnywhereRegex" = "\\b[A-Za-z0-9]|[A-Za-z0-9]\\b|_.|#.|[a-z][A-Z]";
      "vim.highlightedyank.color" = "#343434";
      "vim.highlightedyank.enable" = true;
      "vim.highlightedyank.textColor" = "#ffffff";
      "vim.scroll" = 0;
      "vim.showcmd" = true;
      "vim.surround" = true;
      "vim.useSystemClipboard" = true;
      "vim.vimrc.enable" = false;
      "vim.normalModeKeyBindingsNonRecursive" = [
        {
          # toggle easy motion, but two word
          "before" = [ "s" ];
          "after" = [ "leader" "leader" "2" "s" ];
        }
        {
          # toggle easy motion
          "before" = [ "f" ];
          "after" = [ "leader" "leader" "s" ];
        }
        {
          # get info
          "before" = [ "leader" "i" ];
          "commands" = [ "editor.action.showHover" ];
        }
        {
          # old vim `gi` command
          "before" = [ "leader" "g" "i" ];
          "after" = [ "g" "i" ];
        }
        {
          # goto implementation
          "before" = [ "g" "i" ];
          "commands" = [ "editor.action.peekImplementation" ];
        }
        {
          # goto error
          "before" = [ "g" "e" ];
          "commands" = [ "editor.action.marker.nextInFiles" ];
        }
        {
          # goto word
          "before" = [ "g" "w" ];
          "after" = [ "y" "i" "w" "/" "<C-v>" "<CR>" ];
        }
        {
          # git status/source
          "before" = [ "leader" "g" "s" ];
          "commands" = [ "extension.vim_escape" "workbench.view.scm" ];
          "silent" = true;
        }
        {
          # git log
          "before" = [ "leader" "g" "l" ];
          "commands" = [ "git-graph.view" ];
        }
        {
          # git checkout
          "before" = [ "leader" "g" "c" ];
          "commands" = [ "gitlens.gitCommands.switch" ];
        }
        {
          # yank path (default relative)
          "before" = [ "leader" "y" "p" ];
          "commands" = [ "copy-relative-path-and-line-numbers.both" ];
        }
        {
          # new J
          "before" = [ "J" ];
          "after" = [ "5" "j" ];
        }
        {
          # new K
          "before" = [ "K" ];
          "after" = [ "5" "k" ];
        }
        {
          # new H
          "before" = [ "H" ];
          "after" = [ "5" "h" ];
        }
        {
          # new L
          "before" = [ "L" ];
          "after" = [ "5" "l" ];
        }
        {
          # toggle Sidebar
          "before" = [ "leader" "e" ];
          "after" = [ "workbench.action.toggleSidebarVisibility" ];
        }
      ];
    };
  };
}
