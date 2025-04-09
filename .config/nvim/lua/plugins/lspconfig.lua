return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {},
        rust_analyzer = {},
      },
    },
    config = function(lspconfig, opts)
      local function setup(server)
        require("lspconfig")[server].setup({})
      end

      for server, server_opts in pairs(opts.servers) do
        setup(server)
      end
    end,
  },
}
