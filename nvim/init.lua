require "base"
require "highlights"
require "maps"
require "macos"
require "plugins"
require "current-theme"



local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- Set GIT_EDITOR to use nvr if Neovim and nvr are available
if vim.fn.has('nvim') == 1 and vim.fn.executable('nvr') == 1 then
  vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})


vim.cmd "set foldmethod=indent"
vim.cmd "set foldlevel=99"

