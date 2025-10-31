--! -- -- -- default mappings -- -- -- !--
require "nvchad.mappings"

--! -- -- -- custom mappings -- -- -- !--
local map = vim.keymap.set
local wk = require "which-key"

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Switch to normal mode" })

--! -- -- -- better up/down -- -- -- !--
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

--! -- -- -- Resize window using <ctrl> arrow keys -- -- -- !--
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

--! -- -- -- Move Lines -- -- -- !--
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

--! -- -- -- lazy -- -- -- !--
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

--! -- -- -- window -- -- -- !--
map("n", "-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

--! -- -- -- conform -- -- -- !--
map("n", "<leader>cf", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "conform format file" })

--! -- -- -- menu -- -- -- !--
map("n", "<C-m>", function()
  require("menu").open "default"
end, { desc = "menu open" })

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

--! -- -- -- nvim-session-manager -- -- -- !--
wk.add { "<leader>S", desc = "Session Manager" }

map("n", "<leader>SF", ":SessionManager load_session<CR>", { desc = "Load Session" })
map("n", "<leader>SD", ":SessionManager delete_session<CR>", { desc = "Delete Session" })
map("n", "<leader>SS", ":SessionManager save_current_session<CR>", { desc = "Save Session" })
map("n", "<leader>SL", ":SessionManager load_last_session<CR>", { desc = "Load Last Session" })

--! -- -- --  grug-far -- -- -- !--
map("n", "<leader>rg", "<cmd>GrugFar<CR>", { desc = "GrugFar toggle" })

--! -- -- --  nvim-lspconfig -- -- -- !--
map("n", "<leader>cl", function()
  Snacks.picker.lsp_config()
end, { desc = "Lsp Info" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
map("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "K", function()
  return vim.lsp.buf.hover()
end, { desc = "Hover" })
map("n", "gK", function()
  return vim.lsp.buf.signature_help()
end, { desc = "Signature Help" })
map("i", "<c-k>", function()
  return vim.lsp.buf.signature_help()
end, { desc = "Signature Help" })
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
map("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
map("n", "<leader>cR", function()
  Snacks.rename.rename_file()
end, { desc = "Rename File" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>cA", function()
  vim.lsp.buf.code_action { apply = true, context = {
    only = { "source" },
    diagnostics = {},
  } }
end, { desc = "Source Action" })
map("n", "]]", function()
  Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
map("n", "[[", function()
  Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })
map("n", "<a-n>", function()
  Snacks.words.jump(vim.v.count1, true)
end, { desc = "Next Reference" })
map("n", "<a-p>", function()
  Snacks.words.jump(-vim.v.count1, true)
end, { desc = "Prev Reference" })
