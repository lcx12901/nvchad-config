--! -- -- -- default mappings -- -- -- !--
require "nvchad.mappings"

--! -- -- -- custom mappings -- -- -- !--
local map = vim.keymap.set
local wk = require "which-key"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--! -- -- -- conform -- -- -- !--
map("n", "<leader>cf", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "conform format file" })

--! -- -- -- menu -- -- -- !--
-- map("<C-m>", "n", function()
--   require("menu").open "default"
-- end, { desc = "menu open" })

--! -- -- -- minty -- -- -- !--
wk.add {
  "<leader>ms",
  function()
    require("minty.shades").open()
  end,
  mode = "n",
  icon = { icon = "", color = "green" },
  desc = "minty open shades tool",
}
wk.add {
  "<leader>mh",
  function()
    require("minty.huefy").open()
  end,
  mode = "n",
  icon = { icon = "", color = "green" },
  desc = "minty open huefy tool",
}

--! -- -- -- snacks -- -- -- !--
map("n", "<leader>tl", "<cmd>lua Snacks.lazygit()<CR>", { desc = "Open lazygit" })
