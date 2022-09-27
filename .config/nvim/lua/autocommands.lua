local cmd = vim.cmd

-- remove trailing whitespace from files on save
cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]

-- hide status line on certain windows
cmd [[ autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua require('autocommands').hide_statusline() ]]

-- hide line numbers in terminal windows
cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- open a file from its last left off position
cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- file extension specific tabbing
cmd [[ autocmd Filetype python,solidity setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]

-- Packer
cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- Hybrid line numbers (https://jeffkreeftmeijer.com/vim-number)
cmd [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup end
]]

return {
    hide_statusline = function()
        local api = vim.api
        local buftype = api.nvim_buf_get_option(0, "ft")
        local hidden = {
            "help",
            "dashboard",
            "NvimTree",
            "terminal",
        }

        if vim.tbl_contains(hidden, buftype) then
            api.nvim_set_option("laststatus", 0)
            return
        end

        api.nvim_set_option("laststatus", 2)
    end,
}
