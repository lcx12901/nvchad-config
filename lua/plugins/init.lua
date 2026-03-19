return {
  -- disable unused plugins
  { "mason-org/mason.nvim", enabled = false },
  { "nvim-tree/nvim-tree.lua", enabled = false },
  { "nvim-telescope/telescope.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  { import = "nvchad.blink.lazyspec" },

  -- user configurations
  { "stevearc/conform.nvim", opts = require "configs.conform.opts" },
  { "nvim-treesitter/nvim-treesitter", opts = require "configs.treesitter.opts" },
  { "folke/snacks.nvim", priority = 1000, lazy = false, opts = require "configs.snacks.opts" },
  { "wakatime/vim-wakatime", lazy = false },
  { "m4xshen/hardtime.nvim", dependencies = { "MunifTanjim/nui.nvim" }, lazy = false },
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
      { "mikavilpas/blink-ripgrep.nvim", version = "*" },
      "ribru17/blink-cmp-spell",
      "fang2hou/blink-copilot",
    },
    opts = require "configs.blink.opts",
  },
  {"folke/lazydev.nvim", ft = "lua", cmd = "LazyDev", opts = require "configs.lazydev.opts"},
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, event = "BufEnter" },
  {
    "neovim/nvim-lspconfig",
    opts = require "configs.lspconfig.opts",
    config = function() require "configs.lspconfig.config" end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require "configs.tiny-inline-diagnostic.config"
    end,
  },
  {"dmmulroy/ts-error-translator.nvim", config = function() require "configs.ts-error-translator.config" end},
  {"zbirenbaum/copilot.lua", event = "BufReadPost", opts = require "configs.copilot-lua.opts"},
  {"lewis6991/gitsigns.nvim", config = function() require "configs.gitsigns.config" end},
  {
    "Shatur/neovim-session-manager",
    event = "BufEnter",
    dependencies = { "stevearc/dressing.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.session-manager.config"
    end,
  },
  -- { "HiPhish/rainbow-delimiters.nvim", event = "User FilePost" },
  {"MagicDuck/grug-far.nvim", cmd = "GrugFar", config = function() require("grug-far").setup {} end},
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    event = "BufEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {}
    end,
  },
  {"windwp/nvim-autopairs", event = "InsertEnter", opts = require "configs.autopairs.opts"},
  {"windwp/nvim-ts-autotag", event = "BufEnter", config = function() require("nvim-ts-autotag").setup {} end},
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    event = "BufEnter",
    config = function()
      require("goto-preview").setup {
        default_mappings = true,
      }
    end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufEnter",
    config = function()
      require("package-info").setup {
        hide_up_to_date = true,
        package_manager = "pnpm",
      }
    end,
  },
  {"saghen/blink.indent", event = {"BufReadPost", "BufNewFile"}, opts = require "configs.blink-indent.opts"},
}
