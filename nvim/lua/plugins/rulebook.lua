return {
  "chrisgrieser/nvim-rulebook",
  config = function()
    require("rulebook").setup {}
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = { "typescript", "javascript", "typescriptreact", "typescript.tsx" },
      group = vim.api.nvim_create_augroup("rulebook.prettify-ts-error", { clear = true }),
      callback = function(ctx)
        vim.keymap.set("n", "<leader>cd", function()
          require("rulebook").prettifyError()
        end, { buffer = ctx.buf })
      end,
    })
  end,
}
