return {
  -- disable unused plugins
  { "mason-org/mason.nvim", enabled = false },
  { "nvim-tree/nvim-tree.lua", enabled = false },
  { "nvim-telescope/telescope.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "nvzone/minty", enabled = false },

  { import = "nvchad.blink.lazyspec" },

  -- lsp/completion
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
      { "mikavilpas/blink-ripgrep.nvim", version = "*" },
      "ribru17/blink-cmp-spell",
    },
    opts = require "configs.blink.opts",
  },
  { "folke/lazydev.nvim", ft = "lua", cmd = "LazyDev", opts = require "configs.lazydev.opts" },
  { "neovim/nvim-lspconfig", opts = require "configs.lspconfig.opts", config = require "configs.lspconfig.config" },
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    init = function()
      vim.g.rustaceanvim = require "configs.rustaceanvim.opts"
    end,
  },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", opts = require "configs.treesitter.opts" },

  -- diagnostics/lint
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = require "configs.treesitter-textobjects.opts",
    config = require "configs.treesitter-textobjects.config",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufEnter",
    config = require "configs.treesitter-context.config",
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    opts = require "configs.lint.opts",
    config = require "configs.lint.config",
  },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, event = "BufEnter" },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = require "configs.tiny-inline-diagnostic.config",
  },
  { "dmmulroy/ts-error-translator.nvim", config = require "configs.ts-error-translator.config" },

  -- ui/ux
  { "folke/snacks.nvim", priority = 1000, lazy = false, opts = require "configs.snacks.opts" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = require "configs.noice.opts",
    keys = require "configs.noice.keys",
  },
  { "saghen/blink.indent", event = { "BufReadPost", "BufNewFile" }, opts = require "configs.blink-indent.opts" },
  {
    "kevinhwang91/nvim-ufo",
    event = "LSPAttach",
    dependencies = { { "kevinhwang91/promise-async" } },
    config = require "configs.ufo.config",
  },
  { "folke/sidekick.nvim", keys = require "configs.sidekick.keys" },

  -- editing helpers
  { "stevearc/conform.nvim", opts = require "configs.conform.opts" },

  -- navigation/search
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>m", "<cmd>TSJToggle<cr>", desc = "Toggle Treesj" },
    },
    event = "BufEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {
        use_default_keymaps = false,
      }
    end,
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = require "configs.autopairs.opts" },
  {
    "windwp/nvim-ts-autotag",
    event = "BufEnter",
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
  },
  { "m4xshen/hardtime.nvim", dependencies = { "MunifTanjim/nui.nvim" }, lazy = false, opts = {} },
  { "folke/flash.nvim", event = "VeryLazy", keys = require "configs.flash.keys" },
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    config = function()
      require("grug-far").setup {}
    end,
  },
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    event = "BufEnter",
    config = function()
      require("goto-preview").setup { default_mappings = true }
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = require "configs.yazi.keys",
    opts = require "configs.yazi.opts",
  },

  -- git
  { "lewis6991/gitsigns.nvim", config = require "configs.gitsigns.config" },

  -- sessions/project
  {
    "Shatur/neovim-session-manager",
    event = "BufEnter",
    dependencies = { "stevearc/dressing.nvim", "nvim-lua/plenary.nvim" },
    config = require "configs.session-manager.config",
  },

  -- misc
  { "wakatime/vim-wakatime", lazy = false },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufEnter",
    config = function()
      require("package-info").setup { hide_up_to_date = true, package_manager = "pnpm" }
    end,
  },
  -- { "HiPhish/rainbow-delimiters.nvim", event = "User FilePost" },
}
