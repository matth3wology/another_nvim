-- Auto-closes (), {}, [], "", '', etc. as you type the opening character.
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- lazy-load: only loads once you actually start typing
  opts = {},              -- defaults are sensible; see :help nvim-autopairs for tweaks
}
