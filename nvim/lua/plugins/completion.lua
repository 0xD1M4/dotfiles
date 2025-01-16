-- Disabled for now until I figure out how to migrate nvim-cmp styling
return {
  'saghen/blink.cmp',

  enabled = false,

  lazy = false, -- lazy loading handled internally

  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  version = 'v0.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ["<C-e>"] = { 'select_and_accept' }
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    signature = { enabled = true },

    completion = {
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
        },
      },
    }
  },

  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  -- opts_extend = { "sources.default" }
}
