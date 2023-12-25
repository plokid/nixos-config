{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
    xkb.layout = "us";
    libinput.enable = true;
  };

  services = {
    colord.enable = true;
    geoclue2.enable = true;
  };

  programs = {
    kdeconnect.enable = true;
    # kde 磁盘管理软件，仅仅添加到 systemPackages 是用不了，需要 suid 提权
    partition-manager.enable = true;
    # 很多 gtk 软件需要这个 dconf 来保存设定
    dconf.enable = true;
    # # 用 kleopatra 软件可能需要这个
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
  };

  environment.systemPackages = with pkgs;
    [
      kalendar
      yakuake
      kcolorchooser
      kmail
      plasma-pass
    ]
    ++ (with libsForQt5; [
      ark
      kate
      kcalc
      kmousetool
      krdc
    ]);

  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };
}
