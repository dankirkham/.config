return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "<c-e>", ":FzfLua files<cr>", desc = "FzfLua file picker" } },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  }
}
