--------------------------------------------------------------------------
-- lua/config/lazy.lua
--
-- Bootstraps lazy.nvim (clones it on first run) and loads every plugin
-- spec found in lua/plugins/*.lua. Each file in that folder should
-- `return { ... }` a single plugin spec table.
--------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Every file under lua/plugins/ gets required and its returned
    -- table added as a plugin spec. Add a new plugin by adding a new
    -- file there — no need to edit this file again.
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } }, -- fallback while plugins install
  checker = { enabled = false },             -- set true to auto-check for plugin updates
})
