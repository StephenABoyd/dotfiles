if vim.g.vscode then
  -- Nothing
else
  local util = require 'lspconfig/util'

  -- LSP keymaps
  local on_attach = function(client, bufnr)
    require "lsp_signature".on_attach({
      bind = true,
      handler_opts = {
        border = "rounded"
      }
    }, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- require'lspconfig'.angularls.setup{}
  require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach
      }
    end,

    ['angularls'] = function ()
      local cwd = vim.loop.cwd()
      local tsProbeLocations = '/Users/StephenBoyd/.local/share/nvim/mason/packages/angular-language-server/node_modules,' .. cwd .. '/node_modules'
      local ngProbeLocations = '/Users/StephenBoyd/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/node_modules,' .. cwd .. '/node_modules'
      local cmd = { "ngserver", "--stdio", "--tsProbeLocations", tsProbeLocations, "--ngProbeLocations", ngProbeLocations, "--logFile", "/Users/StephenBoyd/.config/nvim/logger/angularls.log", "--logVerbosity", "normal"}
      require'lspconfig'.angularls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = cmd,
        root_dir = util.root_pattern("angular.json","nx.json"),
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = cmd
        end
      }
    end,

    ["lua_ls"] = function ()
      require'lspconfig'.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      }
    end,

    ['tsserver'] = function ()
      require'lspconfig'.tsserver.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }
    end
  }
end
