-- nvim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.cmd('autocmd FileType markdown setlocal nospell')
vim.opt.wrap = true -- wrap lines
vim.opt.spell = false
vim.o.shell = '/usr/bin/fish'
vim.o.autochdir = true
vim.cmd('autocmd BufEnter * lcd %:p:h')

-- general
lvim.use_icons = true
lvim.log.level = "info"

-- change theme settings
lvim.colorscheme = "catppuccin-mocha"
lvim.transparent_window = true
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.lualine.style = "default"

lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
    "toml",
    "sql",
}

-- additional Plugins
lvim.plugins = {
    { "lunarvim/colorschemes" },
    { "catppuccin/nvim" },
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-ui" },
    { "kristijanhusak/vim-dadbod-completion", after = "nvim-cmp" },
    { "SirVer/ultisnips" },
}

lvim.keys.normal_mode["<leader>D"] = ":DBUIToggle<CR>"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  command = ":lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })",
})

local cmp = require("cmp")
