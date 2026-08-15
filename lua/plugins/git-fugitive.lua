-- Full git workflow: status window, staging, committing, blame, log,
-- push/pull, diffs — basically `git` itself, driven from inside Neovim.
return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gvdiffsplit", "Gclog", "Gread", "Gwrite" },
  keys = {
    { "<leader>gs", "<cmd>Git<CR>",        desc = "Git status" },
    { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
    { "<leader>gp", "<cmd>Git push<CR>",   desc = "Git push" },
    { "<leader>gl", "<cmd>Git pull<CR>",   desc = "Git pull" },
    { "<leader>gb", "<cmd>Git blame<CR>",  desc = "Git blame (full file)" },
  },
}
