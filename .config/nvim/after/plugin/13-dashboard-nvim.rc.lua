-- run commands
local status, dashboard = pcall(require, "dashboard")
local version = vim.version()
local title = string.format("nvim v%s.%s.%s", version["major"], version["minor"], version["patch"])
if not status then
    return
end

dashboard.custom_header = {
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "88888888888888888888888888888888888888888888888888888",
    '8888"""""""""""""""8888888888888888888888888888888888',
    "8888               8888888888888888888888888888888888",
    "8888  " .. title .. "  8888888888888888888888888888888888",
    '8888               888888888888888888888888888888888"',
    "8888aaaaaaaaaaaaaaa888888888888888888888888888888888a",
    "88888888888888888888888888888888888888888888888888888",
    "88888888888888888888888888888888888888888888888888888",
    "88888888888888888888888888888888888888888888888888888",
    '88888888888888888888888":::::"88888888888888888888888',
    "888888888888888888888::;gPPRg;::888888888888888888888",
    "88888888888888888888::dP'   `Yb::88888888888888888888",
    "88888888888888888888::8)     (8::88888888888888888888",
    "88888888888888888888;:Yb     dP:;88( )888888888888888",
    '888888888888888888888;:"8ggg8":;888888888888888888888',
    "88888888888888888888888aa:::aa88888888888888888888888",
    "88888888888888888888888888888888888888888888888888888",
    "88888888888888888888888888888888888888888888888888888",
    '88888888888888888888888888"88888888888888888888888888',
    "8888888888888888888888888:::8888888888888888888888888",
    "8888888888888888888888888:::8888888888888888888888888",
    "8888888888888888888888888:::8888888888888888888888888",
    "8888888888888888888888888:::8888888888888888888888888",
    "8888888888888888888888888:::8888888888888888888888888",
    "88888888888888888888888888a88888888888888888888888888",
    '"""""""""""""""""""\' `"""""""""\' `"""""""""""""""""""',
    "",
}
dashboard.custom_center = {
    {
        action = "DashboardNewFile",
        desc = "New File                  ",
        icon = "洛 ",
        shortcut = "SPC f n",
    },
    {
        action = "Telescope oldfiles",
        desc = "Recents                   ",
        icon = "  ",
        shortcut = "SPC f o",
    },
    {
        action = "Telescope find_files",
        desc = "File File                 ",
        icon = "  ",
        shortcut = "SPC f f",
    },
    {
        action = "Telescope live_grep",
        desc = "Find Word                 ",
        icon = "  ",
        shortcut = "SPC f w",
    },
}
dashboard.custom_footer = {
    "",
    "",
    '"Talk is cheap. Show me the code."',
    "          Linus Torvalds          ",
}

-- mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>db", ":Dashboard <CR>", opts)
map("n", "<leader>fn", ":DashboardNewFile <CR>", opts)
