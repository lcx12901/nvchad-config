require "nvchad.options"

local o = vim.o
local g = vim.g
local opt = vim.opt

o.clipboard = "unnamedplus"
o.cmdheight = 0
o.autoindent = true
o.autoread = true
o.history = 10000
o.undofile = true
o.undolevels = 100000
opt.virtualedit = { "block", "onemore" }
opt.termguicolors = true
o.wrap = true
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.fileencoding = "utf-8"
o.cursorlineopt = "both"

opt.completeopt = {
  "fuzzy",
  "menuone",
  "noselect",
  "popup",
}

if g.neovide then
  g.neovide_hide_mouse_when_typing = true
  g.neovide_no_idle = true
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_animate_command_line = true
  g.neovide_cursor_smooth_blink = true
  g.neovide_cursor_animate_in_insert_mode = true
  g.neovide_cursor_vfx_mode = "sonicboom"
  o.guifont = "Maple Mono NF CN,Noto Color Emoji:h15"

  -- copy_to_clipboard
  vim.keymap.set("v", "<C-S-c>", '"+y', { noremap = true, silent = true })
  -- paste_from_clipboard
  vim.keymap.set("i", "<C-S-v>", "<C-r>+", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-S-v>", '"+p', { noremap = true, silent = true })

  -- paste_from_clipboard in cmd model
  vim.keymap.set("c", "<C-S-v>", "<C-R>+", { noremap = true, silent = true })

  -- paste_from_clipboard in terminal model
  vim.keymap.set("t", "<C-S-v>", '<C-\\><C-n>"+pi', { noremap = true, silent = true })
end
