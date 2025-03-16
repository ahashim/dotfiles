return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.sources = require("cmp").config.sources({
      { name = "lazydev" },
      { name = "nvim_lsp" },
      { name = "path" },
    })
    return opts
  end,
}
