-- run commands
local status, lspconfig = pcall(require, "lspconfig")
if not status then
    return
end

local icons = require "icons"
local protocol = require "vim.lsp.protocol"
local rt = require "rust-tools"

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local common_on_attach = function(client, bufnr)
    --Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

    -- Format on save
    if client.supports_method "textDocument/formatting" then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format {
                    timeout_ms = 3000,
                    buffer = bufnr,
                }
            end,
        })
    end
end

protocol.CompletionItemKind = {
    icons.Text,
    icons.Method,
    icons.Function,
    icons.Constructor,
    icons.Field,
    icons.Variable,
    icons.Class,
    icons.Interface,
    icons.Module,
    icons.Property,
    icons.Unit,
    icons.Value,
    icons.Enum,
    icons.Keyword,
    icons.Snippet,
    icons.Color,
    icons.File,
    icons.Reference,
    icons.Folder,
    icons.EnumMember,
    icons.Constant,
    icons.Struct,
    icons.Event,
    icons.Operator,
    icons.TypeParameter,
    icons.Copilot,
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

----------------------
-- Language Servers --
----------------------

-- css
lspconfig.cssls.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- docker
lspconfig.dockerls.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- golang
lspconfig.gopls.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- lua
lspconfig.lua_ls.setup {
    on_attach = function(client, bufnr)
        common_on_attach(client, bufnr)

        -- no autoformat
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            runtime = {
                version = "LuaJIT",
            },
            telemetry = {
                enable = false,
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
}

-- markdown
lspconfig.marksman.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- python
lspconfig.pyright.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- rust
rt.setup {
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    server = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            common_on_attach(client, bufnr)

            local opts = { buffer = bufnr }

            vim.keymap.set("n", "K", rt.hover_actions.hover_actions(), opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, opts)
            vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
        end,
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate",
                },
                cargo = {
                    allFeatures = true,
                },
                checkOnSave = {
                    command = "clippy",
                },
                inlayHints = { locationLinks = false },
                diagnostics = {
                    enable = true,
                    experimental = {
                        enable = true,
                    },
                },
            },
        },
    },
}

-- solidity
lspconfig.solidity_ls.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- SQL
lspconfig.sqlls.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- tailwind css
lspconfig.tailwindcss.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- toml
lspconfig.taplo.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

-- typescript
lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
        common_on_attach(client, bufnr)

        -- no autoformat
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end,
    capabilities = capabilities,
}

-- yaml
lspconfig.yamlls.setup {
    on_attach = common_on_attach,
    capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type

    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = "",
    })
end

vim.diagnostic.config {
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
}
