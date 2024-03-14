{ pkgs, ... }:

{
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [
      exts.pass-otp
      exts.pass-tomb
      exts.pass-import
      exts.pass-update
      exts.pass-audit
    ]);
  };

  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
    ];
  };
}
