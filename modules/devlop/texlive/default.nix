{ pkgs, ... }:

{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: { inherit (tpkgs) latexmk collection-fontsrecommended collection-langchinese collection-mathscience algorithms; };
  };
}
