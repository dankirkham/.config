return {
  {
      'neoclide/coc.nvim',
      branch = 'release',
      build = function()
        vim.cmd([[CocInstall coc-rust-analyzer]])
      end,
  }
}
