{ pkgs, ... }:

{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        latexmk
        collection-fontsrecommended
        collection-fontsextra
        collection-langchinese
        collection-mathscience
        algorithms
        listings;
    };
  };
}
