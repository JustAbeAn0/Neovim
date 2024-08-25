return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      -- Remove the fzf native plugin for now
      -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
  
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
          }
        },
        -- Remove the fzf extension configuration
        -- extensions = {
        --   fzf = {
        --     fuzzy = true,
        --     override_generic_sorter = true,
        --     override_file_sorter = true,
        --     case_mode = "smart_case",
        --   }
        -- }
      })
  
      -- Remove the fzf extension load
      -- telescope.load_extension('fzf')
      
      -- Add some keymaps
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Find files" })
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = "Live grep" })
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = "Find buffers" })
      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = "Help tags" })
    end
  }