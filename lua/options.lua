require "nvchad.options"

local o = vim.o
local g = vim.g
local opt = vim.opt

o.clipboard = "unnamedplus"
o.cmdheight = 0
o.autoindent = true
o.autoread = true
o.history = 10000
o.termguicolors = true
o.undofile = true
o.undolevels = 100000
opt.virtualedit = {
  "block",
  "onemore",
}
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
end
