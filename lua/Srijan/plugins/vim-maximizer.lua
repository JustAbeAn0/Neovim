return {
    "szw/vim-maximizer",
    keys = {
        { "<leader>mm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
        -- Add visual mode mapping
        { "<leader>mm", "<cmd>MaximizerToggle<CR>gv", mode = "v", desc = "Maximize/minimize a split" },
        -- Add terminal mode mapping
        { "<leader>mm", "<cmd>MaximizerToggle<CR>", mode = "t", desc = "Maximize/minimize a split" },
    },
    -- Add configuration options
    config = function()
        vim.g.maximizer_set_default_mapping = 0       -- Disable default mappings
        vim.g.maximizer_restore_on_winleave = 1       -- Restore layout when leaving window
        vim.g.maximizer_set_mapping_with_bang = 1     -- Use MaximizerToggle! to restore layout
    end,
}
