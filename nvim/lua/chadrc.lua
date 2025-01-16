-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  transparency = false,

  integrations = { "hop" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },

  hl_override = {
    CursorLineNr = {
      fg = "yellow",
    },
    CursorLine = {
      bg = "#31353f",
    },
    TelescopeSelection = {
      bg = "#31353f",
    },
  },
}

M.ui = {
  telescope = {
    style = "bordered",
  },

  tabufline = {
    enabled = false,
  },
}

M.mason = {
  pkgs = {
    "typescript-language-server",
    "lua-language-server",
    "eslint-lsp",
    "prettierd",
    "svelte-language-server",
    "tailwindcss-language-server",
    "shellcheck",
    "bash-language-server",
  },
}

return M
