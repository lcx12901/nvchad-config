local options = {
  fuzzy = {
    implementation = "rust",
    prebuilt_binaries = {
      download = true,
    },
  },

  completion = {
    ghost_text = { enabled = true },
    accept = {
      auto_brackets = { enabled = true },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
      window = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
    },
    list = {
      selection = {
        auto_insert = false,
        preselect = false,
      },
    },
  },

  keymap = {
    preset = "enter",
  },

  signature = {
    enabled = true,
    window = { border = "rounded" },
  },
  sources = {
    default = {
      "lsp",
      "buffer",
      "snippets",
      "path",
      "emoji",
      "ripgrep",
      "spell",
      "avante",
      "copilot",
    },
    providers = {
      lsp = { score_offset = 4 },
      avante = { module = "blink-cmp-avante", name = "Avante", score_offset = 100 },
      emoji = {
        module = "blink-emoji",
        name = "Emoji",
        score_offset = 1,
        opts = {
          insert = true,
          trigger = function()
            return { ":" }
          end,
        },
        should_show_items = function()
          return vim.tbl_contains(
            -- Enable emoji completion only for git commits and markdown.
            -- By default, enabled for all file-types.
            { "gitcommit", "markdown" },
            vim.o.filetype
          )
        end,
      },
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        async = true,
        score_offset = 1,
      },
      spell = {
        module = "blink-cmp-spell",
        name = "Spell",
        score_offset = 1,
      },
      copilot = {
        name = "copilot",
        module = "blink-cmp-copilot",
        score_offset = 100,
        async = true,
      },
    },
  },
}

return options
