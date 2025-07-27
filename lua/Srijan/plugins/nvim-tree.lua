return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
        side = "right",
        adaptive_size = true,
        preserve_window_proportions = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
        highlight_git = true,
        group_empty = true,
      },
      -- Git integration
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      -- Actions configuration
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          },
        },
      },
      -- Diagnostics integration with LSP
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
    
    -- Additional useful keymaps
    keymap.set("n", "<leader>et", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" }) -- focus file explorer
    keymap.set("n", "<leader>es", "<cmd>NvimTreeResize +10<CR>", { desc = "Increase explorer width" }) -- increase width
    keymap.set("n", "<leader>ed", "<cmd>NvimTreeResize -10<CR>", { desc = "Decrease explorer width" }) -- decrease width
  end
}
