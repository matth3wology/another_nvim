-- lua/plugins/alpha.lua
-- Start screen shown when `nvim` is opened with no file argument.

return {
  "goolord/alpha-nvim",
  event = "VimEnter", -- only load right as Neovim starts, not on every buffer
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")


    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<cmd>ene<CR>"),
      dashboard.button("f", "  Explore files", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("r", "  Recent files", "<cmd>browse oldfiles<CR>"),
      dashboard.button("c", "  Edit config", "<cmd>edit $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    -- Little footer with a startup-time readout, filled in once ready
    dashboard.section.footer.val = ""
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyDone",
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = "⚡ "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins loaded in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    alpha.setup(dashboard.opts)
  end,
}
