return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        require("ibl").setup({
            indent = {
                char = "│",  -- Character for indentation line
                highlight = "LineNr"
            },
            scope = {
                enabled = true,
                show_start = true,
                show_end = true,
                highlight = "Function"
            },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                }
            }
        })
    end
}