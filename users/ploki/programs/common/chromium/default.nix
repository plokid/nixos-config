{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "naepdomgkenhinolocfifgehidddafch"; } # browserpass
      { id = "ndcooeababalnlpkfedmmbbbgkljhpjf"; } # ScriptCat
      { id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; } # Vimium C
      { id = "mpkodccbngfoacfalldjimigbofkhgjn"; } # Aria2 Explorer
      { id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; } # Vimium C
      { id = "fihnjjcciajhdojfnbdddfaoknhalnja"; } # I don't care about cookies
      { id = "cimiefiiaegbelhefglklhhakcgmhkai"; } # Plasma Integration
      { id = "bocbaocobfecmglnmeaeppambideimao"; } # Edge Translate
      #{ id = "oicakdoenlelpjnkoljnaakdofplkgnd"; } # Tree Style Tab
      #{ id = "mhloojimgilafopcmlcikiidgbbnelip"; } # iTab
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
    ];
  };
}
