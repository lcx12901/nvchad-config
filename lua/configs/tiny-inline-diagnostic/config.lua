require("tiny-inline-diagnostic").setup {
  preset = "ghost",
  options = {
    add_messages = false,
    multilines = { enabled = true },
    show_source = { enabled = true },
  },
}

vim.diagnostic.config { virtual_text = false }
