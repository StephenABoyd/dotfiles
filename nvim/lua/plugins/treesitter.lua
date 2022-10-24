require'nvim-treesitter.configs'.setup {
  -- A list of parsers
  ensure_installed = { "css", "lua", "typescript", "javascript", "html", "scss", "json" },
	-- Auto install parsers not in list above if file opened
	auto_install = true,
	-- Syntax highlighting config
	highlight = {
		enable = true,
		-- Disabling due to treesitter html syntax highlighting not working
		disable = {"html"}
	},
	indent = {
		enable = true
	}
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Set fold level to 100 to prevent autofolding on open
vim.opt.foldlevel = 100

