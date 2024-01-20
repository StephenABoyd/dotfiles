return {
  {
    'iamcco/markdown-preview.nvim',
    event = 'BufEnter *.md',
    build = 'cd app && npm install',
    config = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    ft = { 'markdown' }
  },
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  {
    'ggandor/leap.nvim',
    config = function() require('leap').add_default_mappings() end,
    dependencies = {'tpope/vim-repeat'},
    event = 'BufEnter *.*'
  }
}
