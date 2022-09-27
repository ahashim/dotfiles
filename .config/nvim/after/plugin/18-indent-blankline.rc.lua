-- run commands
local status, indent_blankline = pcall(require, "indent-blankline")
if not status then
    return
end

indent_blankline.setup {
    buftype_exclude = {
        "terminal",
    },
    char = "▏",
    filetype_exclude = {
        "help",
        "terminal",
        "dashboard",
        "Dashboard",
        "packer",
        "lspinfo",
        "mason",
        "TelescopePrompt",
        "TelescopeResults",
        "",
    },
    indentLine_enabled = 1,
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
}
