return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").sqls.setup({
        cmd = { "sqls", "-config", os.getenv("HOME") .. "/.sqls.yml" },
      })
    end,
  },
}
