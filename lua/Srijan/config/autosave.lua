local function auto_save_file()
  local buf = vim.api.nvim_get_current_buf()
  local buftype = vim.bo[buf].buftype
  local modified = vim.bo[buf].modified
  local modifiable = vim.bo[buf].modifiable
  local filename = vim.api.nvim_buf_get_name(buf)
  
  if modifiable and buftype == "" and modified and filename ~= "" then
    local success, err = pcall(function()
      vim.cmd("silent! write")  -- Silent save to avoid the written message
    end)
    
    if success then
      local file_name = vim.fn.fnamemodify(filename, ":t")
      vim.notify("󰆓 " .. file_name, vim.log.levels.INFO, {
        title = "AutoSaved",
        timeout = 600,
      })
    end
  end
end

-- Create autocmds for autosave
vim.api.nvim_create_autocmd({"InsertLeave", "BufLeave", "WinLeave"}, {
  callback = function()
    auto_save_file()
  end,
})

-- Save before opening terminal
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].modified then
        local buftype = vim.bo[buf].buftype
        if buftype == "" then
          vim.api.nvim_buf_call(buf, function()
            vim.cmd("silent! write")
          end)
        end
      end
    end
  end,
})

-- Keymaps
vim.keymap.set("n", "<C-s>", ":silent write<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:silent write<CR>a", { desc = "Save file in insert mode" })

vim.keymap.set("n", "<leader>cr", function()
  vim.cmd("silent write")  -- Silent save here too
  local filename = vim.fn.expand("%")
  local basename = vim.fn.expand("%:r")
  
  if vim.fn.expand("%:e") == "c" then
    vim.cmd("split")
    vim.cmd("terminal")
    vim.cmd("startinsert")
    local compile_cmd = string.format("gcc %s -o %s.exe && ./%s.exe\n", filename, basename, basename)
    vim.api.nvim_feedkeys(compile_cmd, "t", false)
  end
end, { desc = "Save, compile and run" })

