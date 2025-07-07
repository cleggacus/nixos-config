return { 
  "nvim-treesitter/nvim-treesitter", 
  run = ":TSUpdate", 
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "typescript", "lua", "rust" },
      highlight = { enable = true },
    })
   end,
}
