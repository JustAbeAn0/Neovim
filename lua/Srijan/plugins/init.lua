return {
  "nvim-lua/plenary.nvim", -- Lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- TMUX & split window navigation

  require("Srijan.config.toggleterm"),
  require("Srijan.plugins.alpha"),
  require("Srijan.plugins.bufferline"),
  require("Srijan.plugins.colorscheme"),
  require("Srijan.plugins.comment"),
  require("Srijan.plugins.dressing"),
  require("Srijan.plugins.formatting"),
  require("Srijan.plugins.lazygit"),
  require("Srijan.plugins.linting"),
  require("Srijan.plugins.lualine"),
  require("Srijan.plugins.nvim-cmp"),
  require("Srijan.plugins.luasnip"),
  require("Srijan.plugins.nvim-tree"),
  require("Srijan.plugins.surround"),
  require("Srijan.plugins.treesitter"),
  require("Srijan.plugins.trouble"),
  require("Srijan.plugins.vim-maximizer"),
  require("Srijan.plugins.which-key"),

  -- Newly added plugins
  require("Srijan.plugins.lsp"),
  require("Srijan.plugins.telescope"),
  require("Srijan.plugins.dap"),
  require("Srijan.plugins.gitsigns"),
  require("Srijan.plugins.autopairs"),
  require("Srijan.plugins.indent-blankline"),
}

