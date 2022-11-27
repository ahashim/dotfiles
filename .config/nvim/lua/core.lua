local set = vim.opt

----- Globals -----
vim.g.mapleader = " "

----- General -----
set.backupskip = { "/tmp/*", "/private/tmp/*" }
set.clipboard = "unnamedplus"
set.colorcolumn = "80"
set.cmdheight = 1
set.cursorline = true
set.encoding = "utf-8"
set.hidden = true
set.fileencoding = "utf-8"
set.fillchars = { eob = " " }
set.mouse = "a"
set.shortmess:append "sI"
set.undofile = true
set.whichwrap:append "<>[]hl"
set.wildignore:append { "*/node_modules/*" }

----- Colors -----
set.background = "dark"
set.termguicolors = true

----- Layout -----
set.scrolloff = 5
set.signcolumn = "yes"
set.splitbelow = true
set.splitright = true
set.title = true

----- Numbers -----
set.ignorecase = true
set.number = true
set.numberwidth = 2
set.relativenumber = false
set.ruler = false

----- Tabs -----
set.breakindent = true
set.expandtab = true
set.shiftwidth = 2
set.smartindent = true
set.softtabstop = 2
set.tabstop = 2

----- Text -----
set.ignorecase = true
set.smartcase = true
