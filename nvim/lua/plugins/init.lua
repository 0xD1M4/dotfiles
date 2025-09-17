return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  -- {
  --   "stevearc/conform.nvim",
  --   event = "BufWritePre", -- uncomment for format on save
  --   opts = require "configs.conform",
  -- },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   'saghen/blink.cmp',
    -- },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "lua",
        "query",
        "html",
        "svelte",
        "css",
        "javascript",
        "typescript",
      },
    },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    event = "VeryLazy",
    opts = {},
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension "fzf"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    -- event = "BufReadPre",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "tadaa/vimade",
    event = "VeryLazy",

    opts = {
      recipe = { "duo" },
      tint = { bg = { rgb = { 0, 0, 0 }, intensity = 0.35 } },
      fadelevel = 0.45,
    },
  },

  {
    "Aasim-A/scrollEOF.nvim",
    event = "BufReadPre",
    opts = {},
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   enabled = false
  -- }
}
