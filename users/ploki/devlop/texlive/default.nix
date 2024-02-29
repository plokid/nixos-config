{ pkgs, ... }:

{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        latexmk
        latexindent
        collection-fontsrecommended
        collection-fontsextra
        collection-langchinese
        collection-mathscience
        algorithms
        biblatex
        biblatex-trad
        biblatex-ieee
        biblatex-gb7714-2015
        biber
        xltxtra
        xstring
        realscripts
        xifthen
        ifmtarg
        titlesec
        enumitem
        nth
        setspace
        cite
        listings;
    };
  };
}
