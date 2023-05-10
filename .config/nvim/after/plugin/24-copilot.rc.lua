-- run commands
local status_copilot, copilot = pcall(require, "copilot")
if not status_copilot then
    return
end

copilot.setup {
    suggestion = { enabled = false },
    panel = { enabled = false },
}

local status_cmp, cmp = pcall(require, "copilot.cmp")
if not status_cmp then
    return
end

cmp.setup()
