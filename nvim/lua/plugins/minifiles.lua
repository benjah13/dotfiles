return {
  "echasnovski/mini.files",
  version = false,
  config = function()
    require("mini.files").setup {
      windows = {
        preview = true,
      },
    }
    vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<Return>", { silent = true })
  end,
}
