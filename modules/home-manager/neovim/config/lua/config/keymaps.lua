vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = true })

vim.keymap.set('n', 'H', '^', { noremap = true })                 -- H to move to beginning of line
vim.keymap.set('n', 'L', '$', { noremap = true })                 -- L to move to end of line

vim.keymap.set('n', 'sv', ':vsplit<CR>', { noremap = true, silent = true }) -- sv to split vertically
vim.keymap.set('n', 'sh', ':split<CR>', { noremap = true, silent = true })  -- sh to split horizontally

local wk = require('which-key')

wk.add({
  { "<leader>pv", desc = "Previous View" },
})
