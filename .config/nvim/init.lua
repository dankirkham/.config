require("config.lazy")

vim.opt.listchars= { tab = '▸·', trail = '·' }
vim.opt.list = true

vim.opt.relativenumber = false
vim.opt.number = true

vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.autoindent = true
vim.opt.expandtab = true

vim.opt.colorcolumn="80"
vim.opt.wrap = false

vim.opt.laststatus=2

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.ignorecase = true
vim.opt.incsearch = true

vim.opt.scrolloff=0

-- macOS compatibility
vim.opt.ffs={'unix' , 'dos'}
vim.opt.ff='unix'

vim.opt.signcolumn="yes"

vim.opt.updatetime=300

vim.g.mapleader = " "

vim.cmd.colorscheme('slate')

vim.keymap.set('n', '<leader>\\', ':vsp<CR>')
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>')
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>q', ':wincmd q<CR>')

vim.keymap.set('n', '<leader>s', ':set et<CR>')
vim.keymap.set('n', '<leader>t', ':set noet<CR>')

vim.keymap.set('n', '<leader>2', ':set sw=2 ts=2<CR>')
vim.keymap.set('n', '<leader>4', ':set sw=4 ts=4<CR>')

vim.keymap.set('n', '<leader>u', ':noh<CR>')

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'jellybeans',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
