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
    null_ls.builtins.diagnostics.luacheck.with {
        args = { "-g", "--formatter", "plain", "--codes", "--ranges", "--filename", "$FILENAME", "-" },
    },
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.solhint,

    -- formatting
    null_ls.builtins.formatting.black.with {
        extra_args = { "--line-length", "79" },
    },
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.prettierd.with {
        extra_args = { "--print-width", "120" },
    },
    null_ls.builtins.formatting.reorder_python_imports,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.stylua,
}

null_ls.setup {
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format {
                        bufnr = bufnr,
                        filter = function(formatting_client)
                            return formatting_client.name == "null-ls"
                        end,
                    }
                end,
            })
        end
    end,
    sources = my_sources,
}
