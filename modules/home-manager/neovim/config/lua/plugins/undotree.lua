return {
  "mbbill/undotree",
  lazy = true,                -- load only when needed
  cmd = "UndotreeToggle",     -- load when this command is run
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
  },
  config = function()
    vim.keymap.set('n', '<leader>u', "<cmd>UndotreeToggle<CR>", { desc = 'Toggle UndoTree' })

    local wk = require('which-key')

    wk.add({
      { "<leader>u", group = "UndoTree" },
    })
  end,
},
