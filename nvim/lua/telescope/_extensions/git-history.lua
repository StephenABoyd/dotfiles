if vim.g.vscode then
  -- Nothing
else
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values

  return require("telescope").register_extension {
    exports = {
      history = function (opts)
        opts = opts or {}
        pickers.new(opts, {
          prompt_title="colors",
          finder = finders.new_table {
            results = {'red', 'blue', 'green'}
          },
          sorter = conf.generic_sorter(opts)
        }):find()
      end
    }
  }
end
