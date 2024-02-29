{ pkgs, ... }:

{
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
  };

  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
    ];
  };
}
