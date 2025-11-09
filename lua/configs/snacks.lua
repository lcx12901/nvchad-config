local options = {
  input = { enabled = true },
  notifier = { enabled = true },
  lazygit = { enabled = true },
  words = { enabled = true },
  statuscolumn = {
    enabled = true,
    folds = {
      open = true,
      git_hl = true,
    },
  },
  picker = {
    sources = {
      noice = {
        confirm = { "close" },
      },
    },
    win = {
      list = {
        on_buf = function(self)
          self:execute "calculate_file_truncate_width"
        end,
      },
      preview = {
        on_buf = function(self)
          self:execute "calculate_file_truncate_width"
        end,

        on_close = function(self)
          self:execute "calculate_file_truncate_width"
        end,
      },
    },
    layouts = {
      select = {
        layout = {
          relative = "cursor",
          width = 70,
          min_width = 0,
          row = 1,
        },
      },
    },
  },
}

return options
