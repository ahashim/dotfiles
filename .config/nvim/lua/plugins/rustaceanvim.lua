return {
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server = opts.server or {}
      opts.server.settings = vim.tbl_deep_extend("force", opts.server.settings or {}, {
        ["rust-analyzer"] = {
          procMacro = {
            enable = true,
            ignored = {
              ["async-recursion"] = { "async_recursion" },
              ["napi-derive"] = { "napi" },
            },
          },
        },
      })
      return opts
    end,
  },
}
