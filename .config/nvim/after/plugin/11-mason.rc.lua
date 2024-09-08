-- run commands
local status, mason = pcall(require, "mason")
if not status then
  return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  return
end

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

lspconfig.setup {
  ensure_installed = {
    "cssls",
    "dockerls",
    "marksman",
    "pyright",
    "lua_ls",
    "sqls",
    "tailwindcss",
    "taplo",
    "ts_ls",
    "yamlls",
  },
}

lspconfig.setup_handlers({
  function(server_name)
    server_name = server_name == 'tsserver' and 'ts_ls' or server_name
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
})
