
local parsers = {
  "lua", "vim", "vimdoc", "query",
  "javascript", "typescript", "tsx", "html", "css", "json",
  "python", "go", "rust", "c", "bash", "cpp",
  "yaml", "toml", "dockerfile",
  "markdown", "markdown_inline",
}
 
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false, -- load at startup so highlighting is ready the moment a file opens
  config = function()
    require("nvim-treesitter").setup()
 
    -- Install any of the listed parsers that aren't already present.
    require("nvim-treesitter").install(parsers)
 
    -- The new API no longer auto-enables highlighting/indent like the old
    -- `configs.setup{ highlight = { enable = true } }` did — we turn them
    -- on ourselves whenever a buffer with a known language opens.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and vim.treesitter.language.add(lang) then
          pcall(vim.treesitter.start)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
