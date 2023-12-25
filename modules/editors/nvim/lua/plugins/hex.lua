return {
  "RaafatTurki/hex.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    require("hex").setup(opts)
  end,
  keys = { { "<leader>h", "<Cmd>HexToggle<CR>", desc = "toggle Hex mode" } },
}
