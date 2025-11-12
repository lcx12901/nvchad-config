return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = { enabled = false },
      signature = { enabled = false },
    },

    messages = {
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
    },

    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },

    cmdline = {
      format = {
        cmdline = {
          pattern = "^:",
          icon = " ",
          lang = "vim",
          opts = {
            border = {
              text = {
                top = "Cmd",
              },
            },
          },
        },
      },
    },

    routes = {
      -- Skip search_count messages
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = {
          skip = true,
        },
      },
      -- Skip annoying "written" messages
      {
        filter = {
          event = "msg_show",
          find = "written",
        },
        opts = {
          skip = true,
        },
      },
      -- Skip "search hit BOTTOM/TOP" messages
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "search hit BOTTOM" },
            { find = "search hit TOP" },
          },
        },
        opts = {
          skip = true,
        },
      },
      {
        filter = {
          event = "notify",
          any = {
            { find = "No information available" },
            { find = "No signature help available" },
          },
        },
        opts = {
          skip = true,
        },
      },
      -- Route long messages (>20 lines) to split
      {
        filter = {
          event = "msg_show",
          min_height = 20,
        },
        view = "split",
        opts = {
          enter = true,
        },
      },
    },
  },
  keys = {
    { "<leader>sn", "", desc = "noice" },
    {
      "<S-Enter>",
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      mode = "c",
      desc = "Redirect Cmdline",
    },
    {
      "<leader>snl",
      function()
        require("noice").cmd "last"
      end,
      desc = "Noice Last Message",
    },
    {
      "<leader>snh",
      function()
        require("noice").cmd "history"
      end,
      desc = "Noice History",
    },
    {
      "<leader>sna",
      function()
        require("noice").cmd "all"
      end,
      desc = "Noice All",
    },
    {
      "<leader>snd",
      function()
        require("noice").cmd "dismiss"
      end,
      desc = "Dismiss All",
    },
    {
      "<leader>snt",
      function()
        require("noice").cmd "pick"
      end,
      desc = "Noice Picker (Telescope/FzfLua)",
    },
    {
      "<c-f>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Forward",
      mode = { "i", "n", "s" },
    },
    {
      "<c-b>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Backward",
      mode = { "i", "n", "s" },
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)
  end,
}
