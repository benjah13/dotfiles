local common = require "plugins.lsp.servers.common"

return {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  handlers = common.handlers,
  init_options = {
    preferences = {
      -- other preferences...
      importModuleSpecifierPreference = "relative",
      -- importModuleSpecifierEnding = "minimal",
    },
  },
}
