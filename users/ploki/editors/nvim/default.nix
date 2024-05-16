{ pkgs, ... }: {
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
      better-escape-nvim
      clangd_extensions-nvim
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      conform-nvim
      crates-nvim
      dracula-nvim
      dressing-nvim
      flash-nvim
      friendly-snippets
      gitsigns-nvim
      headlines-nvim
      indent-blankline-nvim
      kanagawa-nvim
      lualine-nvim
      marks-nvim
      neo-tree-nvim
      neoconf-nvim
      neodev-nvim
      neorg
      nix-develop-nvim
      noice-nvim
      none-ls-nvim
      nui-nvim
      nvim-cmp
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
      nvim-lint
      nvim-lspconfig
      nvim-notify
      nvim-spectre
      nvim-treesitter
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-ts-autotag
      nvim-ts-context-commentstring
      nvim-web-devicons
      oil-nvim
      overseer-nvim
      persistence-nvim
      plenary-nvim
      project-nvim
      # rust-tools-nvim
      rustaceanvim
      sqlite-lua
      telescope-fzf-native-nvim
      telescope-nvim
      tmux-navigator
      todo-comments-nvim
      tokyonight-nvim
      trouble-nvim
      vim-illuminate
      vim-startuptime
      vscode-nvim
      which-key-nvim
      # { name = "LuaSnip"; path = luasnip; }
      # { name = "blame-me.nvim"; path = blame-me-nvim; }
      # { name = "catppuccin"; path = catppuccin-nvim; }
      # { name = "cmake-gtest.nvim"; path = cmake-gtest-nvim; }
      # { name = "cmake-tools.nvim"; path = cmake-tools-nvim; }
      # { name = "huez.nvim"; path = huez-nvim; }
      # { name = "mini.ai"; path = mini-nvim; }
      # { name = "mini.bufremove"; path = mini-nvim; }
      # { name = "mini.comment"; path = mini-nvim; }
      # { name = "mini.indentscope"; path = mini-nvim; }
      # { name = "mini.pairs"; path = mini-nvim; }
      # { name = "mini.surround"; path = mini-nvim; }
      # { name = "yanky.nvim"; path = yanky-nvim; }
    ];
    extraPackages = with pkgs; [
      vimPlugins.LazyVim
      fira-code
      #-- Misc
      tree-sitter # common language parser/highlighter
      nodePackages.prettier # common code formatter
      marksman # language server for markdown
      glow # markdown previewer
      fzf
      xxd

      ripgrep # fast search tool, required by AstroNvim's '<leader>fw'(<leader> is space key)
      fd
      lazygit
      wl-clipboard
    ];
  };

  # home.packages = [ pkgs.neovide ];
}
