return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzy-native.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-project.nvim',
        'nvim-telescope/telescope-media-files.nvim',  -- Preview media files
        'nvim-telescope/telescope-ui-select.nvim',    -- Better UI for selections
        'debugloop/telescope-undo.nvim',             -- Undo tree visualization
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<CR>"] = actions.select_tab,
                        ["<C-x>"] = actions.select_horizontal, -- Open in horizontal split
                        ["<C-v>"] = actions.select_vertical,   -- Open in vertical split
                    },
                    n = {
                        ["<CR>"] = actions.select_tab,  -- Open file in a new tab
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                    }
                },

                -- Enhanced appearance
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        preview_width = 0.6,
                        results_width = 0.4,
                    },
                    width = 0.95,
                    height = 0.85,
                    preview_cutoff = 120,
                },

                -- Better performance
                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    "dist/",
                    "build/",
                    "%.lock"
                },

                -- Better visuals
                prompt_prefix = " 🔍 ",
                selection_caret = " ❯ ",
                path_display = { "truncate" },
                set_env = { ["COLORTERM"] = "truecolor" },
            },
            
            pickers = {
                find_files = {
                    hidden = true,
                    no_ignore = false,
                    follow = true,
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end
                },
            },

            extensions = {
                fzy_native = {
                    override_generic_sorter = true,
                    override_file_sorter = true,
                },
                file_browser = {
                    hijack_netrw = true,
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
                undo = {
                    use_delta = true,
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
            }
        })

        -- Load all extensions
        telescope.load_extension('fzy_native')
        telescope.load_extension('file_browser')
        telescope.load_extension('project')
        telescope.load_extension('ui-select')
        telescope.load_extension('undo')
        telescope.load_extension('media_files')

        -- Existing keymaps
        vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Find files" })
        vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = "Live grep" })
        vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = "Find buffers" })
        vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = "Help tags" })
        
        -- Additional useful keymaps
        vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = "Search in current buffer" })
        vim.keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', { desc = "Colorscheme picker" })
        vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = "Recent files" })
        vim.keymap.set('n', '<leader>fp', '<cmd>Telescope project<cr>', { desc = "Projects" })
        vim.keymap.set('n', '<leader>fe', '<cmd>Telescope file_browser<cr>', { desc = "File browser" })
        vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = "Diagnostics" })
        vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { desc = "Git status" })

        -- New keymaps
        vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<cr>', { desc = "Undo tree" })
        vim.keymap.set('n', '<leader>fm', '<cmd>Telescope media_files<cr>', { desc = "Media files" })
        vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = "Show keymaps" })
        vim.keymap.set('n', '<leader>fM', '<cmd>Telescope man_pages<cr>', { desc = "Man pages" })
        vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { desc = "Git commits" })
        vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = "Git branches" })
    end
}