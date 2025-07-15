return {
  "neovim/nvim-lspconfig",
  dependencies = { "folke/which-key.nvim" },
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup({
      cmd = { "lua-language-server" },
    })

    lspconfig.rust_analyzer.setup({
      cmd = { "rust-analyzer" },
    })

    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float)
    vim.keymap.set('n', '<c-p>', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<c-n>', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>vq', vim.diagnostic.setloclist)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)

      end,
    })

    local wk = require('which-key')

    wk.add({
      { "gD", desc = "Go to Declaration" },
      { "gd", desc = "Go to Definition" },
      { "gi", desc = "Go to Implementation" },
      { "gr", desc = "References" },
      { "K", desc = "Hover Documentation" },
      { "<C-k>", desc = "Signature Help" },
    
      { "<leader>wa", desc = "Add Workspace Folder" },
      { "<leader>wr", desc = "Remove Workspace Folder" },
      { "<leader>wl", desc = "List Workspace Folders" },
      { "<leader>D", desc = "Go to Type Definition" },
      { "<leader>rn", desc = "Rename Symbol" },
      { "<leader>f", desc = "Format Buffer" },
      { "<leader>vd", desc = "Show Diagnostics Float" },
      { "<leader>vq", desc = "Set Location List Diagnostics" },
    
      { "<leader>ca", desc = "Code Action" },
    })
  end,
}
