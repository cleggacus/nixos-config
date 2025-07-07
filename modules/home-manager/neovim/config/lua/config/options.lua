-- general vim setup
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- undo tree
vim.opt.undofile = true

local undo_dir = vim.fn.stdpath('config') .. '/undo'

if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end

vim.opt.undodir = undo_dir

