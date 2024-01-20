return {
  -- LSP Configs
  {
    'neovim/nvim-lspconfig',
    event = 'BufEnter *.*'
  },
  -- LSP Package Manager
  {
    'williamboman/mason.nvim',
    event = 'BufEnter *.*',
    config = function ()
      require("mason").setup()
    end
  },
  -- Integrate Mason with lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    event = 'BufEnter *.*',
    opts = {
      ensure_installed = {
        "lua_ls",
        "angularls",
        "html",
        "cssls",
        "jsonls",
        "eslint",
        "tsserver",
        "yamlls",
        "emmet_ls"
      }
    },
    config = function (_, opts)
      require("mason-lspconfig").setup(opts)
    end
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'BufEnter *.*',
    config = function()
      local cfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = 'rounded'
        }
      }
      require'lsp_signature'.setup(cfg)
    end
  },
  -- Autocomplete
  {
    'hrsh7th/cmp-nvim-lsp',
    event = 'BufEnter *.*',
    dependencies = {'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp' },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'vsnip' }
        }),
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select'})
        }),
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        }
      })
    end
  }
}
