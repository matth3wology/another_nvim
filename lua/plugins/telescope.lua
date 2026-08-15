-- Fuzzy finder: find files by name, grep file contents across the repo,
-- switch buffers, etc. `live_grep` shells out to ripgrep, which must be
-- installed separately (see install note below).
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Optional but recommended: native sorter, much faster fuzzy matching.
    -- Needs a C compiler (you already have one from setting up tree-sitter-cli).
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Find file" },
    { "<leader>ps", "<cmd>Telescope live_grep<CR>", desc = "Search string in repo" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "%.git/", "dist/", "target/", "%.lock" },
        -- Telescope's previewer still calls into nvim-treesitter's OLD api
        -- (removed on the new `main` branch) to highlight preview panes.
        -- Disabling this avoids a crash; previews fall back to regular
        -- syntax highlighting instead, which still looks fine.
        preview = { treesitter = false },
      },
    })
    -- Loads the fzf-native sorter if it built successfully; harmless no-op if not.
    pcall(telescope.load_extension, "fzf")
  end,
}
