-- lua/plugins/lualine.lua
-- Statusline: mode, git branch, diagnostics, filetype, cursor position.

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- loads after startup, not blocking initial launch
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "wombat", -- adapts to whatever colorscheme is active
      globalstatus = true, -- one statusline for the whole window, not per-split
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "diagnostics" }, { "filename", path = 1 } }, -- path=1: relative path
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
