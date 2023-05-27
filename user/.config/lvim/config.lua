-- nvim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.cmd('autocmd FileType markdown setlocal nospell')
vim.opt.wrap = true -- wrap lines
vim.opt.spell = false
vim.o.shell = '/usr/bin/bash'

-- general
lvim.use_icons = false
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}

-- change theme settings
lvim.colorscheme = "gruvbox"
lvim.transparent_window = true
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- additional Plugins
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "ellisonleao/gruvbox.nvim" },
  { "puremourning/vimspector" },
  { "OmniSharp/omnisharp-vim" },
  { "SirVer/ultisnips" },
}

-- vimspector options
vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_enable_mappings_for_mode = {
  ['<leader><leader>'] = { 'n', 'v' },
}
