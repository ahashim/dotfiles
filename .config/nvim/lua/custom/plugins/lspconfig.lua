local M = {}

M.setup_lsp = function(attach, capabilities)
    local lspconfig = require "lspconfig"

    local eslint = {
        lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
        lintIgnoreExitCode = true,
        lintStdin = true,
        lintFormats = {
            "%f(%l,%c): %tarning %m",
            "%f(%l,%c): %rror %m"
        },
        lintSource = "eslint"
    }
    local prettier = {
        formatCommand = 'prettierd "${INPUT}"',
        formatStdin = true,
    }

    -- eslint
    lspconfig.efm.setup {
        on_attach = function(client)
            if client.resolved_capabilities.document_formatting then
                vim.cmd [[augroup Format]]
                vim.cmd [[autocmd! * <buffer>]]
                vim.cmd [[autocmd BufWritePost <buffer> lua require'custom.plugins.formatting'.format()]]
                vim.cmd [[augroup END]]
            end
        end,
        capabilities = capabilities,
        init_options = {documentFormatting = true},
        root_dir = vim.loop.cwd,
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        settings = {
            languages = {
                javascript = {eslint, prettier},
                javascriptreact = {eslint, prettier},
                typescript = {eslint, prettier},
                typescriptreact = {eslint, prettier},
            },
            rootMarkers = {".git/", "package.json", ".eslintrc*"},
        }
    }

    -- typescript
    lspconfig.tsserver.setup {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
        end,
        capabilities = capabilities,
    }

    -- solidity
    lspconfig.solang.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"solang", "--language-server"},
        filetypes = {"solidity"},
        root_dir = vim.loop.cwd,
        settings = {
            rootMarkers = {".git"}
        }
    }
end

return M
