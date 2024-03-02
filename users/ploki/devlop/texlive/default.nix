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
        background
        biblatex
        biblatex-trad
        biblatex-ieee
        biblatex-gb7714-2015
        biber
        xltxtra
        xstring
        framed
        realscripts
        xifthen
        ifmtarg
        titlesec
        multirow
        enumitem
        everypage
        nth
        setspace
        cite
        listings;
    };
  };
}
