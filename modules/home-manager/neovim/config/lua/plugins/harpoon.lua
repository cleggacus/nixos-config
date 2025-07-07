return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require('harpoon')

    harpoon:setup({})

    
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}

      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end
    
      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end
    
    vim.keymap.set("n", "<leader>hv", function() toggle_telescope(harpoon:list()) end)
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end)
    
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end)
    vim.keymap.set("n", "<leader>h7", function() harpoon:list():select(7) end)
    vim.keymap.set("n", "<leader>h8", function() harpoon:list():select(8) end)
    vim.keymap.set("n", "<leader>h9", function() harpoon:list():select(9) end)
    vim.keymap.set("n", "<leader>h0", function() harpoon:list():select(10) end)
    
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)

    local wk = require('which-key')

    wk.add({
      { "<leader>h", group = "Harpoon" },
      { "<leader>hv", desc = "Harpoon View" },
      { "<leader>ha", desc = "Harpoon Add" },
      { "<leader>hr", desc = "Harpoon Remove" },
                   
      { "<leader>h1", desc = "Harpoon 1" },
      { "<leader>h2", desc = "Harpoon 2" },
      { "<leader>h3", desc = "Harpoon 3" },
      { "<leader>h4", desc = "Harpoon 4" },
      { "<leader>h5", desc = "Harpoon 5" },
      { "<leader>h6", desc = "Harpoon 6" },
      { "<leader>h7", desc = "Harpoon 7" },
      { "<leader>h8", desc = "Harpoon 8" },
      { "<leader>h9", desc = "Harpoon 9" },
      { "<leader>h0", desc = "Harpoon 10" },

      { "<leader>hp", desc = "Previous" },
      { "<leader>hn", desc = "Next" },
    })   
  end,
}
