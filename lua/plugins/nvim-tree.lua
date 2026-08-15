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
    filters = {
      dotfiles = false,      -- show hidden/dotfiles
      git_ignored = false,   -- show gitignored files
      custom = { "^.git$" }, -- but still hide the .git folder specifically
    },
    git = {
      ignore = false,        -- also needed in some versions to stop git-ignore filtering
    },
  },
}
