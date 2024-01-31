-- run commands
local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

treesitter.setup {
    autotag = {
        enable = true,
    },
    auto_install = true,
    ensure_installed = "all",
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    ignore_install = {},
    modules = {},
    sync_install = false,
}
