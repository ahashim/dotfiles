-- run commands
local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

treesitter.setup {
    autotag = {
        enable = true,
    },
    ensure_installed = {
        "cpp",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "gitignore",
        "go",
        "gomod",
        "http",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "ruby",
        "rust",
        "solidity",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
}
