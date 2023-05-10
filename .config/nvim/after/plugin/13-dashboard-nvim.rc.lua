-- run commands
local status, dashboard = pcall(require, "dashboard")
local version = vim.version()
local title = string.format("nvim v%s.%s.%s", version["major"], version["minor"], version["patch"])
if not status then
    return
end

dashboard.setup {
    theme = "hyper",
    config = {
        header = {
            "",
            "",
            "",
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
            "",
        },
        mru = {
            label = " Recent Files",
            limit = 6,
        },
        packages = {
            enable = false,
        },
        project = {
            enable = false,
            label = " Recent Projects",
        },
        shortcut = {
            {
                action = "Telescope oldfiles",
                desc = "Recents",
                group = "@property",
                icon = " ",
                key = "o",
            },
            {
                action = "Telescope find_files",
                desc = "File file",
                group = "Number",
                icon = " ",
                key = "f",
            },
            {
                action = "Telescope live_grep",
                desc = "Find word",
                group = "Label",
                icon = " ",
                key = "w",
            },
        },
        week_header = {
            enable = false,
        },
    },
    hide = {
        statusline = true,
        tabline = true,
        winbar = true,
    },
}

-- mappings
vim.keymap.set("n", "<leader>db", ":Dashboard <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>db", ":Dashboard <CR>", { noremap = true, silent = true })
