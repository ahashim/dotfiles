-- run commands
local present, null_ls = pcall(require, "null-ls")
if not present then
    return
end

-- full source list
local my_sources = {
    -- code actions
    null_ls.builtins.code_actions.gitsigns,

    -- completion
    null_ls.builtins.completion.luasnip,

    -- diagnostics
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.diagnostics.solhint,

    -- formatting
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
}

null_ls.setup {
    on_attach = function(client)
        -- auto format on save
        if client.server_capabilities.document_formatting then
            vim.cmd [[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]]
        end
    end,
    sources = my_sources,
}
