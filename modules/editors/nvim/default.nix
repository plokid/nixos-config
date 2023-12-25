{pkgs, ...}: {
  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua".source = ./lua;
  };
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      LazyVim
      lazy-nvim
      nvim-treesitter.withAllGrammars
    ];
    extraPackages = with pkgs; [
      #-- Misc
      tree-sitter # common language parser/highlighter
      nodePackages.prettier # common code formatter
      marksman # language server for markdown
      glow # markdown previewer
      fzf

      ripgrep # fast search tool, required by AstroNvim's '<leader>fw'(<leader> is space key)
      fd
      lazygit
      wl-clipboard
    ];
  };

  home.packages = [pkgs.neovide];
}
