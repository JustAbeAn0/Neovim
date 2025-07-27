return {
  "okuuva/auto-save.nvim",
  event = { "FocusLost" },
  config = function()
    require("auto-save").setup({
      -- Autosave only on focus lost
      trigger_events = { "FocusLost" , "TermEnter"},

      -- NEW: Custom on_save notification (uses `vim.notify`)
      on_save = function()
        vim.notify("AutoSaved on focus lost at " .. vim.fn.strftime("%H:%M:%S"), vim.log.levels.INFO, {
          title = "AutoSave",
          timeout = 1500,
        })
      end,

      -- Filter unwanted filetypes or buffers
      condition = function(buf)
        local ft = vim.bo[buf].filetype
        local bt = vim.bo[buf].buftype
        return vim.bo[buf].modifiable
          and bt == ""
          and ft ~= "lazy" and ft ~= "NvimTree" and ft ~= "help"
      end,
    })
  end,
}

