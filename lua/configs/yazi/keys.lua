return {
  {
    "<leader>e",
    mode = { "n", "v" },
    "<cmd>Yazi<cr>",
    desc = "Open yazi at the current file",
  },
  {
    -- Open in the current working directory
    "<leader>E",
    "<cmd>Yazi cwd<cr>",
    desc = "Open the file manager in nvim's working directory",
  },
  {
    "<c-up>",
    "<cmd>Yazi toggle<cr>",
    desc = "Resume the last yazi session",
  },
}
