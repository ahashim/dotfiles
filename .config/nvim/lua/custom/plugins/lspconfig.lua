-- custom language server settings
local M = {}

M.setup_lsp = function(attach, capabilities)
    local lsp_installer = require("nvim-lsp-installer");

    -- default on_attach function for all servers
    local function on_attach(_, bufnr)
       local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
       end
       local function buf_set_option(...)
          vim.api.nvim_buf_set_option(bufnr, ...)
       end

       -- Enable completion triggered by <c-x><c-o>
       buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

       -- Mappings.
       local opts = { noremap = true, silent = true }

       -- See `:help vim.lsp.*` for documentation on any of the below functions
       buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
       buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
       buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
       buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
       buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
       buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
       buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
       buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
       buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
       buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
       buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
       buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
       buf_set_keymap("n", "ge", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
       buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
       buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
       buf_set_keymap("n", "<space>l", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
       buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
       buf_set_keymap("v", "<space>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
    end

    -- default options initialized for all servers
    local default_opts = {
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
    }

    -- list of servers using out of the box defaults
    local default_servers = {
        -- "bashls",
        "cssls",
        -- "dockerls",
        -- "eslint",
        "html",
        "jsonls",
        "gopls",
        -- "graphql",
        -- "pyright",
        -- "stylelint_lsp",
        -- "rust_analyzer",
        "sumneko_lua",
        -- "sqls",
        "tailwindcss",
    }

    -- initialize default servers
    for _, name in pairs(default_servers) do
      local server_is_found, server = lsp_installer.get_server(name)
      if server_is_found then
        if not server:is_installed() then
          print("Installing " .. name)
          server:install()
        end
        server:on_ready(function(server)
            server:setup(default_opts)
        end)
      end
    end

    -- custom LSP server configuration
    lsp_installer.on_server_ready(function(server)
        -- variables
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

        local custom_servers = {
            ["efm"] = function()
                default_opts.init_options = {documentFormatting = true}
                default_opts.on_attach = function(client)
                    if client.resolved_capabilities.document_formatting then
                        vim.cmd [[augroup Format]]
                        vim.cmd [[autocmd! * <buffer>]]
                        vim.cmd [[autocmd BufWritePost <buffer> lua require'custom.plugins.formatting'.format()]]
                        vim.cmd [[augroup END]]
                    end
                    on_attach()
                end
                default_opts.settings = {
                    languages = {
                        javascript = {eslint, prettier},
                        javascriptreact = {eslint, prettier},
                        typescript = {eslint, prettier},
                        typescriptreact = {eslint, prettier},
                    },
                    rootMarkers = {".git/", "package.json", ".eslintrc*", ".prettierrc*"}
                }
            end,
            ["solang"] = function()
                default_opts.filetypes = {
                    "solidity",
                }
                default_opts.cmd = {"solang", "--language-server"}
            end,
            ["tsserver"] = function()
                default_opts.on_attach = function(client)
                    client.resolved_capabilities.document_formatting = false
                    on_attach()
                end
            end,
        }

        -- initialize with custom settings (fallback to defaults)
        local server_options = custom_servers[server.name] and custom_servers[server.name]() or default_opts
        server:setup(server_options)
    end)
end

return M
