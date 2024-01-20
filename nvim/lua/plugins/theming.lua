return {
  -- 'sainnhe/sonokai',
  -- 'navarasu/onedark.nvim',
  -- {
  --   'shaunsingh/nord.nvim',
  --   name = 'nord',
  --   config = function()
  --     vim.g.nord_contract = true
  --     require('nord').set()
  --     -- vim.cmd.colorscheme "nord"
  --   end
  -- },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require("catppuccin").setup({
          flavour = "frappe", -- latte, frappe, macchiato, mocha
          background = { -- :h background
              light = "latte",
              dark = "frappe",
          },
          compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
          transparent_background = true,
          term_colors = true,
          dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.95,
          },
          styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
          },
          color_overrides = {},
          custom_highlights = {},
          integrations = {
              cmp = true,
              nvimtree = true,
              telescope = true,
          },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
