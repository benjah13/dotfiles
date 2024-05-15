return {

  "williamboman/mason-lspconfig.nvim",
  config = function()
    local status, lspconfig = pcall(require, "mason-lspconfig")
    if not status then
      return
    end

    lspconfig.setup {
      ensure_installed = {
        "graphql",
        "html",
        "jsonls",
        "tailwindcss",
        "tsserver",
        "helm_ls",
        "yamlls",
      },
    }
  end,
}
