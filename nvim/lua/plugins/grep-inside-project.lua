local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values

local M = {}

local grep_inside_project = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }

      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,

    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers
    .new(opts, {
      debounce = 200,
      prompt_title = "Project Grep",
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
    })
    :find()
end

-- vim.keymap.set("n", "<leader>pg", function()
--   grep_inside_project()
-- end, { desc = "[P]roject [G]rep" })
--
-- vim.keymap.set("n", "<leader>pG", function()
--   grep_inside_project {
--     default_text = vim.fn.expand "<cword>",
--     additional_args = function(args)
--       return vim.list_extend(args, {
--         "--hidden",
--         -- "--no-ignore"
--       })
--     end,
--   }
-- end, { desc = "[P]roject [G]rep with hovered text" })
--
return M
