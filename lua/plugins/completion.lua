-- lua/plugins/completion.lua
-- Completion engine: shows the suggestion popup as you type and lets you
-- select/insert entries. This is the *display* layer — it pulls from
-- "sources" (buffer words, file paths, snippets, and later: LSP).
--
-- Right now, without Mason/LSP installed yet, you'll get completions from
-- open buffers, file paths, and snippets. Once LSP is added later, it
-- automatically becomes a source too — nothing in this file needs to
-- change for that to happen.

return {
  "saghen/blink.cmp",
  version = "*",                                     -- use latest stable release, not main (avoids breaking changes)
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" }, -- common snippet collection
  opts = {
    keymap = { preset = "enter" },                   -- <C-space> open/toggle docs, <Tab>/<CR> accept, arrows to navigate
    appearance = {
      -- Requires a Nerd Font in your terminal to render icons correctly;
      -- falls back to plain text otherwise (still functional, less pretty).
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      menu = { border = "rounded" },
    },
    sources = {
      -- "lsp" is listed now so it activates automatically the moment an
      -- LSP server attaches later — no changes needed here at that point.
      default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true, window = { border = "rounded" } },
  },
}
