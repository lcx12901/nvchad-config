return {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    progress = { enabled = false },
    signature = { enabled = false },
    hover = { enabled = false },
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
          { find = "Empty hover response" },
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
}
