return {
  { import = "nvchad.blink.lazyspec" },

  -- disable unuse plugins
  { "mason-org/mason.nvim", enabled = false },
  { "nvim-tree/nvim-tree.lua", enabled = false },

  { "stevearc/conform.nvim", opts = require "configs.conform-nvim" },
  { "nvim-treesitter/nvim-treesitter", opts = require "configs.nvim-treesitter" },
  { "folke/snacks.nvim", priority = 1000, lazy = false, opts = require "configs.snacks" },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "HiPhish/rainbow-delimiters.nvim", event = "User FilePost" },
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "User FilePost",
    opts = {
      symbol = "╎",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },
}
