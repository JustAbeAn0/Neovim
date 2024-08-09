return {
  "nvim-lua/plenary.nvim", -- Lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- TMUX & split window navigation

  -- Add the toggleterm.nvim plugin
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup{
        size = 20,
        open_mapping = [[<c-\>]],
        direction = 'horizontal',
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true,
        shell = 'pwsh.exe',
      }
    end
  },
}

