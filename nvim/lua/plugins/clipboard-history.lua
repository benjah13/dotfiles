return {
  "royanirudd/clipboard-history.nvim",
  opts = {
    max_history = 200, -- Optional: set max history (default 100)
  },
  config = function()
    vim.keymap.set("n", "<leader>yh", ":ClipboardHistory<CR>", { noremap = true, silent = true })
  end,
}
