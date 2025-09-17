-- require "nvchad.mappings"

local map = vim.keymap.set

-- Selected nvchad mappings --

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

--
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- Custom mappings --
-- add yours here

map("n", "Q", "<nop>")

map("n", "<M-w>", ":w!<cr>") -- Saving file using Cmd+S

map("n", "<leader>j", ":HopChar1<cr>", { desc = "Jump to char" })

map("n", "<leader><Tab>", "<cmd>b#<cr>", { desc = "Switch to previous buffer" })

map("n", "<leader>en", function()
  vim.diagnostic.goto_next()
end, { desc = "[E]rror [N]ext" })

map("n", "<leader>ep", function()
  vim.diagnostic.goto_prev()
end, { desc = "[E]rror [P]rev" })
map("n", "<leader>eN", function()
  vim.diagnostic.goto_prev()
end, { desc = "[E]rror [P]rev" })

map("n", "<leader>pf", function()
  require("telescope.builtin").find_files { hidden = true, no_ignore = false }
end, { desc = "Search project files" })

map("n", "<leader>ff", "<cmd>Telescope file_browser path=%:p:h<cr>", { desc = "File browser" })

map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[F]ile [H]elp tags" })

map("n", "<leader>pg", function()
  require("telescope.builtin").live_grep {
    additional_args = function(args)
      return vim.list_extend(args, {
        "--hidden",
        -- "--no-ignore"
      })
    end,
  }
end, { desc = "[P]roject [G]rep" })

map("n", "<leader>pG", function()
  require("telescope.builtin").live_grep {
    default_text = vim.fn.expand "<cword>",
    additional_args = function(args)
      return vim.list_extend(args, {
        "--hidden",
        -- "--no-ignore"
      })
    end,
  }
end, { desc = "[P]roject [G]rep" })

map("n", "<leader>pe", function()
  require("telescope.builtin").find_files {
    cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy"),
  }
end, { desc = "[P]ackage [E]xplore" })

map("n", "<leader>w/", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>ft", "<cmd>NvimTreeFocus<cr>", { desc = "nvimtree focus window" })

-- map("n", "<leader>wk", "<C-w>o<cmd>%bd|e#<cr>", { desc = "[W]indow [K]eep active and clean other buffers" })
map(
  "n",
  "<leader>wk",
  "<C-w>o<cmd>lua Snacks.bufdelete.other()<cr>",
  { desc = "[W]indow [K]eep active and clean other buffers" }
)

map("n", "<leader>pr", function()
  require("grug-far").open()
end, { desc = "[P]roject [R]eplace" })

map("n", "<leader>ss", function()
  require("persistence").select()
end, { desc = "[S]elect [S]ession" })

-- Duplicate a line and comment out the first line
map("n", "<leader>cy", "yygccp", { desc = "Copy-comment-paste", remap = true })
map("n", "<leader>cl", "gcc", { desc = "toggle comment", remap = true })

map("v", "<leader>cy", "yygccp", { desc = "Copy-comment-paste", remap = true })
map("v", "<leader>cl", "gcc", { desc = "toggle comment", remap = true })

map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action({apply=true})<cr>", { desc = "[C]ode [A]ction", remap = true })

-- INSERT MODE --

map("i", "<M-w>", "<Esc>:w!<cr>") -- Saving file using Cmd+S in insert mode

map("i", "<M-BS>", "<C-W>")       -- Deleting whole word using Alt+Backspace
