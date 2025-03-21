return {
  -- https://github.com/ThePrimeagen/harpoon
  'ThePrimeagen/harpoon',
  lazy = false,
  branch = 'master',
  event = 'VimEnter',
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon_mark = require 'harpoon.mark'
    local harpoon_ui = require 'harpoon.ui'

    require('harpoon').setup()

    -- Key mappings for adding files and toggling Harpoon menu
    -- vim.keymap.set("n", "<leader>A", function() harpoon_mark.add_file() end, { desc = "Add file to Harpoon" })
    vim.keymap.set('n', '<leader>a', function()
      harpoon_mark.add_file()
    end, { desc = 'Add file to Harpoon' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon_ui.toggle_quick_menu()
    end, { desc = 'Toggle Harpoon menu' })

    -- Key mappings for navigating Harpoon marks
    vim.keymap.set('n', '<C-h>', function()
      harpoon_ui.nav_file(1)
    end, { desc = 'Go to Harpoon mark 1' })
    vim.keymap.set('n', '<C-j>', function()
      harpoon_ui.nav_file(2)
    end, { desc = 'Go to Harpoon mark 2' })
    vim.keymap.set('n', '<C-k>', function()
      harpoon_ui.nav_file(3)
    end, { desc = 'Go to Harpoon mark 3' })
    vim.keymap.set('n', '<C-l>', function()
      harpoon_ui.nav_file(4)
    end, { desc = 'Go to Harpoon mark 4' })

    -- Key mappings for replacing marks at specific positions
    local function replace_mark_at(index)
      harpoon_mark.rm_file(index) -- Safely remove the mark at the index
      harpoon_mark.add_file() -- Add the current file to Harpoon
    end

    vim.keymap.set('n', '<leader><C-h>', function()
      replace_mark_at(1)
    end, { desc = 'Replace Harpoon mark 1' })
    vim.keymap.set('n', '<leader><C-t>', function()
      replace_mark_at(2)
    end, { desc = 'Replace Harpoon mark 2' })
    vim.keymap.set('n', '<leader><C-n>', function()
      replace_mark_at(3)
    end, { desc = 'Replace Harpoon mark 3' })
    vim.keymap.set('n', '<leader><C-s>', function()
      replace_mark_at(4)
    end, { desc = 'Replace Harpoon mark 4' })
  end,
}
