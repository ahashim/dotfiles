-- noctalia_colors.lua — fail-soft bridge for Noctalia v4's hyprlang palette.
-- Noctalia regenerates noctalia/noctalia-colors.conf and runs `hyprctl reload`;
-- this file re-parses it on every config (re)load (invoked via dofile from
-- hyprland.lua, so no module caching). Any failure falls back to the palette
-- hardcoded below — never a config error.
--
-- When Noctalia's Hyprland template starts emitting a .lua file natively
-- (v5+), replace this whole file with a dofile() of the generated file.

local FALLBACK = {
  primary   = "rgb(ffb94f)",
  surface   = "rgb(17130e)",
  secondary = "rgb(ddc2a1)",
  error     = "rgb(ffb4ab)",
  tertiary  = "rgb(b8cea1)",
}

local function read_palette()
  local cfg = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
  local f = io.open(cfg .. "/hypr/noctalia/noctalia-colors.conf", "r")
  if not f then return {} end
  local c = {}
  for line in f:lines() do
    -- %b() requires balanced parens: a line truncated mid-write simply won't match.
    local k, v = line:match("^%$([%w_]+)%s*=%s*(rgba?%b())")
    if k then c[k] = v end
  end
  f:close()
  return c
end

local ok, palette = pcall(read_palette)
local c = setmetatable(ok and palette or {}, { __index = FALLBACK })

pcall(hl.config, {
  general = {
    col = { active_border = c.primary, inactive_border = c.surface },
  },
  group = {
    col = {
      border_active          = c.secondary,
      border_inactive        = c.surface,
      border_locked_active   = c.error,
      border_locked_inactive = c.surface,
    },
    groupbar = {
      col = {
        active          = c.secondary,
        inactive        = c.surface,
        locked_active   = c.error,
        locked_inactive = c.surface,
      },
    },
  },
})
