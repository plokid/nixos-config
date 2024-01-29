{
  home.persistence."/nix/persist/home/ploki" = {
    allowOther = true;
    removePrefixDirectory = true;
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Templates"
      "nixos-config"
      "VMs"
      "Program"
      "Zotero"
      "Games"
      "Desktop"
      ".cache"
      ".config"
      ".thunderbird"
      ".cargo"
      ".local"
      ".mozilla"
      ".zotero"
      ".vscode"
      ".minecraft"
      ".gnupg"
      ".ssh"
      #   {
      #     directory = ".gnupg";
      #     mode = "0700";
      #   }
      #   {
      #     directory = ".ssh";
      #     mode = "0700";
      #   }
    ];
    files = [
      ".hmcl.json"
      ".zsh_history"
    ];
  };
}

