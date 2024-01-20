local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

return require("telescope").register_extension {
  exports = {
    affected = function (opts)
      opts = opts or {}
      local command = {"npx", "nx", "print-affected"}
      pickers.new(opts, {
        prompt_title="affected",
        finder = finders.new_oneshot_job(command, opts),
        sorter = conf.generic_sorter(opts)
      }):find()
    end
  }
}
