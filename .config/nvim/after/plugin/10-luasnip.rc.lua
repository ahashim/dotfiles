-- run commands
local status, luasnip = pcall(require, "luasnip")
if not status then
    return
end

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}

require("luasnip.loaders.from_vscode").lazy_load()
