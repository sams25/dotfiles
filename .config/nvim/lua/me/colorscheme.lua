-- This always exists by default, do not change
vim.cmd "colorscheme industry"

-- Else, install something else
local colorscheme = "eldar"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("WARNING: Colorscheme " .. colorscheme .. " not found!")
  return
end
