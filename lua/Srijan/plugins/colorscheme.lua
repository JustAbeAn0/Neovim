return {
    "tiagovla/tokyodark.nvim",
    opts = {
        transparent_background = false,
        gamma = 1.00,
        styles = {
            comments = { italic = true },
            keywords = { italic = false },
            identifiers = { italic = true },
            functions = {}, -- no additional styling
            variables = {}, -- no additional styling
        },
        custom_highlights = function(highlights, palette)
            -- Add or modify highlights here
            return highlights
        end,
        custom_palette = function(palette)
            -- Add or modify palette colors here
            return palette
        end,
        terminal_colors = true,
    },
    config = function(_, opts)
        require("tokyodark").setup(opts)
        vim.cmd [[colorscheme tokyodark]]
    end,
  }
