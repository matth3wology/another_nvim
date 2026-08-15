--------------------------------------------------------------------------
-- init.lua — bare-bones starter (no plugins yet)
-- Neovim 0.12.x
--------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--------------------------------------------------------------------------
-- Color
--------------------------------------------------------------------------
vim.cmd("colorscheme habamax")

--------------------------------------------------------------------------
-- OPTIONS
--------------------------------------------------------------------------
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Behavior
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"
opt.swapfile = false
opt.updatetime = 200
opt.timeoutlen = 400
opt.confirm = true
opt.inccommand = "split"

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false -- don't fold everything by default when you open a file
opt.foldlevel = 99     -- start with everything unfolded (high number = mostly open)

--------------------------------------------------------------------------
-- KEYMAPS
--------------------------------------------------------------------------
local map = vim.keymap.set

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

require("config.lazy")
