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

    -- eslint
    lspconfig.efm.setup {
        on_attach = on_attach,
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
                javascript = {eslint},
                javascriptreact = {eslint},
                typescript = {eslint},
                typescriptreact = {eslint},
            },
            rootMarkers = {".git/", "package.json", ".eslintrc*"},
        }
    }

    -- typescript
    lspconfig.tsserver.setup {
        on_attach = on_attach,
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
