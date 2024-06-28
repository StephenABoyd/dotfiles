return {
  {
    "nvim-neotest/neotest",
    enabled = function() return vim.g.vscode == nil end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest"
    },
    keys = {
      { '<leader>tt', function() require("neotest").run.run(vim.fn.expand("%")) end, 'Run test file'},
      { '<leader>tn', function() require("neotest").run.run() end, 'Run nearest test'},
      { '<leader>tw', function() require('neotest').run.run({ jestCommand = 'npx jest --watch ' }) end, 'Open Jest in Watch Mode'},
      { '<leader>ts', function() require("neotest").summary.toggle() end, 'Open Test Summary'}
    },
    opts = {
      status = { virtual_text = true },
      output = { open_on_run = true }
    },
    config = function (_, opts)
      opts.adapters = {
        require("neotest-jest")({
          jestCommand = 'npx jest',
          jestConfigFile = function ()
            local currentFileFolder = vim.fn.expand('%:p:h')
            if string.find(currentFileFolder, '/src/lib') then
              return string.match(currentFileFolder, "(.-/[^/]+/)src") .. "jest.config.ts"
            end

            return vim.fn.getcwd() .. "/jest.config.ts";
          end,
          cwd = function(path)
            return vim.fn.getcwd()
          end
        })
      }
      require('neotest').setup(opts)
    end
  }
}
