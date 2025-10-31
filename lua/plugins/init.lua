return {
  { import = "nvchad.blink.lazyspec" },

  -- disable unuse plugins
  { "mason-org/mason.nvim", enabled = false },
  { "nvim-tree/nvim-tree.lua", enabled = false },

  { "stevearc/conform.nvim", opts = require "configs.conform-nvim" },
  { "nvim-treesitter/nvim-treesitter", opts = require "configs.nvim-treesitter" },
  { "folke/snacks.nvim", priority = 1000, lazy = false, opts = require "configs.snacks" },
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
      {
        "mikavilpas/blink-ripgrep.nvim",
        version = "*",
      },
      "ribru17/blink-cmp-spell",
      {
        "Kaiser-Yang/blink-cmp-dictionary",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    opts = require "configs.blink",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
  {
    "Shatur/neovim-session-manager",
    event = "BufEnter",
    dependencies = { "stevearc/dressing.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local Path = require "plenary.path"
      local config = require "session_manager.config"
      require("session_manager").setup {
        sessions_dir = Path:new(vim.fn.stdpath "state", "sessions"),
        autoload_mode = config.AutoloadMode.GitSession,
      }
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
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    config = function()
      require("grug-far").setup {}
    end,
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    event = "BufEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {}
    end,
  },
}
