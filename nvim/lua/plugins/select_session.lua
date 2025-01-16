local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {
  "select_session",
  name = "select_session",
  dev = { true },
  dir = "~/.config/nvim/lua/plugins/select_session.lua",
  enabled = false,
}

M.select_session = function(opts)
  opts = opts or {}

  local uv = vim.uv or vim.loop

  ---@type { session: string, dir: string, branch?: string }[]
  local items = {}
  local have = {} ---@type table<string, boolean>

  local Config = require "persistence.config"

  for _, session in ipairs(require("persistence").list()) do
    if uv.fs_stat(session) then
      local file = session:sub(#Config.options.dir + 1, -5)
      local dir, branch = unpack(vim.split(file, "%%", { plain = true }))
      dir = dir:gsub("%%", "/")

      if not have[dir] then
        have[dir] = true
        items[#items + 1] = dir -- { session = session, dir = dir, branch = branch }
      end
    end
  end

  pickers
    .new(opts, {
      prompt_title = "Select Session",
      finder = finders.new_table {
        results = items,
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if selection then
            vim.fn.chdir(selection[1])
            require("persistence").load()
          end
        end)
        return true
      end,
    })
    :find()
end

return M
