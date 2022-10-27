-- Automatically bootstrap packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Automatically update packages when this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

--usein Overrides

-- Git Blame (APZelos/blamer.vim)
-- --Enable Blamer by default
vim.g.blamer_enabled = 1
-- --Delay Blamer
vim.g.blamer_delay = 500

----Vim Test
vim.g['test#strategy'] = 'neovim'
--Preserve Screen
vim.g['test#preserve_screen'] = 1
--Use Jest
vim.g['test#javascript#runner'] = 'jest'

-- Install packages
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use {
		'hrsh7th/cmp-nvim-lsp',
		requires = {'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp' },
		config = function()
		end
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require("telescope").setup{
				extensions = {
					file_browser = {
						files = false
					}
				}
			}
		end
	}
	use 'tpope/vim-surround'
	use 'APZelos/blamer.nvim'
	use 'airblade/vim-gitgutter'
	use 'vim-test/vim-test'
	use {'iamcco/markdown-preview.nvim', run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }}
	use {'Equilibris/nx.nvim', config = function() require("nx").setup {} end}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'j-hui/fidget.nvim', config = function() require"fidget".setup{} end}
	use {'nvim-telescope/telescope-file-browser.nvim', config = function() require("telescope").load_extension "file_browser" end}
  use 'sainnhe/sonokai'
	use 'navarasu/onedark.nvim'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly', -- optional, updated every week. (see issue #1193)
		config = function() require("nvim-tree").setup() end
	}
  use 'vim-airline/vim-airline'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use {'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end, requires = {'tpope/vim-repeat'}}
	use {'windwp/nvim-ts-autotag', config = function() require'nvim-treesitter.configs'.setup {
		autotag = {
			enable = true,
		}
	}  end}
end)

