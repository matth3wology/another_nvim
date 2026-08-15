-- Git integration: gutter signs for added/changed/removed lines, plus
-- hunk-level stage/reset/preview/blame, right inside the buffer.
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = vim.keymap.set
 
      map("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next git hunk" })
      map("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev git hunk" })
      map("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
      map("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
      map("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
      map("n", "<leader>hb", gs.blame, { buffer = bufnr, desc = "Blame line" })
      map("n", "<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Diff against index" })
    end,
  },
}
