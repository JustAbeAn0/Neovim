return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    local devicons = require("nvim-web-devicons")

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.fg },
        c = { bg = colors.inactive_bg, fg = colors.fg },
      },
    }

    local last_file_bufnr = nil
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function(args)
        local buftype = vim.api.nvim_buf_get_option(args.buf, "buftype")
        local bufname = vim.api.nvim_buf_get_name(args.buf)
        local filetype = vim.api.nvim_buf_get_option(args.buf, "filetype")
        
        -- Only track actual file buffers, not terminals or special buffers
        if buftype == "" and bufname ~= "" and not bufname:match("term://") and filetype ~= "terminal" then
          last_file_bufnr = args.buf
        end
      end,
    })

    local function show_file_in_tab()
      -- Always use the last file buffer, don't fall back to current buffer
      if not last_file_bufnr or not vim.api.nvim_buf_is_valid(last_file_bufnr) then
        return " [No File]"
      end

      local name = vim.api.nvim_buf_get_name(last_file_bufnr)

      if name == "" then
        return " [No File]"
      end

      local filename = vim.fn.fnamemodify(name, ":t")
      local ext = vim.fn.fnamemodify(name, ":e")
      local icon, _ = devicons.get_icon(filename, ext, { default = true })
      return icon .. " " .. filename
    end

    lualine.setup({
      options = {
        theme = my_lualine_theme,
        section_separators = '',
        component_separators = '',
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          { show_file_in_tab },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    })
  end,
}

