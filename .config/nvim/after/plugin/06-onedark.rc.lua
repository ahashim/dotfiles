-- run commands
local status, onedark = pcall(require, "onedark")
if not status then
    return
end

onedark.setup {
    style = "darker",
}

onedark.load()
