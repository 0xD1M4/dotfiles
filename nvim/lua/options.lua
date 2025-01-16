require "nvchad.options"

-- add yours here!

local o = vim.o

o.number = true
o.relativenumber = true

o.cursorline = true
o.cursorlineopt = "both"

o.signcolumn = "yes"
o.numberwidth = 3

o.wrap = true
o.linebreak = true
o.scrolloff = 12
o.sidescroll = 12

o.sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize"

o.showtabline = 0
o.winbar = "%f %m"

local function update_winbar()
  local buf_count = #vim.fn.getbufinfo { buflisted = 1 }
  o.winbar = "(" .. buf_count .. ") %f %m"
end
-- Autocmd to update the winbar on BufEnter and WinEnter events
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = update_winbar,
})
