local function setup(_, conf)
  local actions = require "telescope.actions"

  local file_ignore_patterns = {
    "^.git/",
    "^.log/",
    "^.github/",
    "/node_modules/",
    "package-lock.json",
  }

  conf.defaults.file_ignore_patterns = file_ignore_patterns

  conf.defaults.mappings.i = {
    ["<Esc>"] = actions.close,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,

    ["<M-BS>"] = function()
      vim.api.nvim_input "<c-s-w>"
    end,
  }

  conf.extensions["ui-select"] = {
    require("telescope.themes").get_dropdown {},
  }

  conf.extensions.fzf = {
    fuzzy = true, -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true, -- override the file sorter
    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    -- the default case_mode is "smart_case"
  }

  conf.extensions.file_browser = {
    hijack_netrw = true,
    hidden = true,
    respect_gitignore = false,
    prompt_path = true,
    hide_parent_dir = true,

    file_ignore_patterns = {},

    mappings = {
      i = {
        ["<C-h>"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
        ["<C-r>"] = require("telescope._extensions.file_browser.actions").rename,
        ["<C-p>"] = require("telescope._extensions.file_browser.actions").move,
        ["<C-d>"] = require("telescope._extensions.file_browser.actions").remove,
      },
    },
  }
end

return setup
