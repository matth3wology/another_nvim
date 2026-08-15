return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons next to file names
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>nf", "<cmd>NvimTreeFindFile<CR>", desc = "Find file in explorer" },
  },
  opts = {
    view = { width = 30 },
    renderer = { group_empty = true },
    filters = { dotfiles = false },
  },
}
