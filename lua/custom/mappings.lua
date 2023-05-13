---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["F2"] = { ":Ex <CR>", "toggle explore"},
  },
}

-- more keybinds!

M.copilot = {
  plugin = true,
  n = {
    ["<leader>cp"] =
      { function ()
        require('copilot').accept()
      end,
      },
 },
}
return M
