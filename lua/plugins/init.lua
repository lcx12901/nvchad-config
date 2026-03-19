return {
  { import = "nvchad.blink.lazyspec" },

  -- disable unused plugins
  { "mason-org/mason.nvim", enabled = false },
  { "nvim-tree/nvim-tree.lua", enabled = false },
  { "nvim-telescope/telescope.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  -- user configurations
  { "stevearc/conform.nvim", opts = require "configs.conform-nvim" },
  { "nvim-treesitter/nvim-treesitter", opts = require "configs.nvim-treesitter" },
  { "folke/snacks.nvim", priority = 1000, lazy = false, opts = require "configs.snacks" },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
      {
        "mikavilpas/blink-ripgrep.nvim",
        version = "*",
      },
      "ribru17/blink-cmp-spell",
      "fang2hou/blink-copilot",
    },
    opts = require "configs.blink",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = false },
      inlay_hints = { enabled = true },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup {
        preset = "ghost",
        options = {
          add_messages = false,
          multilines = { enabled = true },
          show_source = { enabled = true },
        },
      }

      vim.diagnostic.config { virtual_text = false }
    end,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    config = function()
      require("ts-error-translator").setup {
        auto_attach = true,
        servers = {
          "astro",
          "svelte",
          "ts_ls",
          "typescript-tools",
          "volar",
          "vtsls",
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "BufReadPost",
    opts = {
      nes = { enabled = false },
      panel = { enabled = false },
      suggestion = { enabled = false },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,

        current_line_blame_opts = {
          delay = 500,

          ignore_blank_lines = true,
          ignore_whitespace = true,
          virt_text = true,
          virt_text_pos = "eol",
        },
      }
    end,
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
  -- { "HiPhish/rainbow-delimiters.nvim", event = "User FilePost" },
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
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufEnter",
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
  },
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
  {
    "saghen/blink.indent",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      scope = {
        enabled = true,
        char = "▎",
        priority = 1000,
        highlights = {
          "BlinkIndentOrange",
          "BlinkIndentYellow",
          "BlinkIndentGreen",
          "BlinkIndentCyan",
          "BlinkIndentBlue",
          "BlinkIndentViolet",
        },
      },
    },
  },
}
