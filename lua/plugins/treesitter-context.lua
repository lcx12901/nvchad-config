return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufEnter",
  opts = {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor",
    separator = "-",
    zindex = 20,
  },
  config = function(_, opts)
    require("treesitter-context").setup(opts)
  end,
}
