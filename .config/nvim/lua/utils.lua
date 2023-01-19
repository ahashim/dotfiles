local M = {}
local sysname = vim.loop.os_uname.sysname

function M.is_mac()
  return sysname == 'Darwin'
end

function M.is_linux()
  return sysname == 'Linux'
end

return M
