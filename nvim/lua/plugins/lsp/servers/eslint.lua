local nvim_lsp = require "lspconfig"

return {
  on_attach = function(client, bufnr)
    -- Call the common on_attach first
    require("plugins.lsp.servers.common").on_attach(client, bufnr)

    -- Then add eslint-specific functionality
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  settings = {
    workingDirectory = {
      mode = "location",
    },
  },
  root_dir = nvim_lsp.util.find_git_ancestor,
}
