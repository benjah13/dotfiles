return {
  "neovim/nvim-lspconfig",
  config = function()
    local status, nvim_lsp = pcall(require, "lspconfig")
    if not status then
      return
    end

    local protocol = require "vim.lsp.protocol"

    -- Common configuration
    local common = require "plugins.lsp.servers.common"

    -- Set up completion icons
    protocol.CompletionItemKind = common.completion_icons

    -- Get common capabilities
    local capabilities = common.get_capabilities()

    -- Set up UI enhancements
    common.setup_ui()

    -- Load and setup each language server
    local servers = {
      "yamlls",
      "helm_ls",
      "ts_ls",
      "eslint",
      "jsonls",
      "tailwindcss",
    }

    for _, server in ipairs(servers) do
      local server_config = require("plugins.lsp.servers." .. server)
      nvim_lsp[server].setup(vim.tbl_extend("force", {
        on_attach = common.on_attach,
        capabilities = capabilities,
      }, server_config))
    end
  end,
}
