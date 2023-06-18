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
  { "CRAG666/code_runner.nvim" },
}

-- vimspector options
vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_enable_mappings_for_mode = {
  ['<leader><leader>'] = { 'n', 'v' },
}

-- code runner options
require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3 -u",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
    cs = function(...)
      local root_dir = require("lspconfig").util.root_pattern "*.csproj" (vim.loop.cwd())
      return "cd " .. root_dir .. " && dotnet run$end"
    end,
  },
})

vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
