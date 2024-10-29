return {
  {
      'neoclide/coc.nvim',
      branch = 'release',
      build = function()
        vim.cmd([[CocInstall coc-rust-analyzer]])
      end,
      init = function()
        vim.cmd([[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]])
      end,
  }
}
