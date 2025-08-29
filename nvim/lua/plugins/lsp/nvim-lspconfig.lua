return {
  "neovim/nvim-lspconfig",
  config = function()
    local status, nvim_lsp = pcall(require, "lspconfig")
    if not status then
      return
    end

    local protocol = require "vim.lsp.protocol"

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      if client.name == "ts_ls" then
        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
      end
      local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end

      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      --Enable completion triggered by <c-x><c-o>
      buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Mappings.
      local opts = { noremap = true, silent = true }

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    end

    protocol.CompletionItemKind = {
      "", -- Text
      "", -- Method
      "", -- Function
      "", -- Constructor
      "", -- Field
      "", -- Variable
      "", -- Class
      "ﰮ", -- Interface
      "", -- Module
      "", -- Property
      "", -- Unit
      "", -- Value
      "", -- Enum
      "", -- Keyword
      "﬌", -- Snippet
      "", -- Color
      "", -- File
      "", -- Reference
      "", -- Folder
      "", -- EnumMember
      "", -- Constant
      "", -- Struct
      "", -- Event
      "ﬦ", -- Operator
      "", -- TypeParameter
    }

    -- Set up completion using nvim_cmp with LSP source
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    nvim_lsp.flow.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
    vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

    local border = {
      { "🭽", "FloatBorder" },
      { "▔", "FloatBorder" },
      { "🭾", "FloatBorder" },
      { "▕", "FloatBorder" },
      { "🭿", "FloatBorder" },
      { "▁", "FloatBorder" },
      { "🭼", "FloatBorder" },
      { "▏", "FloatBorder" },
    }

    -- LSP settings (for overriding per client)
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    nvim_lsp.yamlls.setup {}

    nvim_lsp.helm_ls.setup {
      settings = {
        ["helm-ls"] = {
          logLevel = "info",
          valuesFiles = {
            mainValuesFile = "values.yaml",
            lintOverlayValuesFile = "values.lint.yaml",
            additionalValuesFilesGlobPattern = "values*.yaml",
          },
          yamlls = {
            enabled = true,
            diagnosticsLimit = 50,
            showDiagnosticsDirectly = false,
            path = "yaml-language-server",
            config = {
              schemas = {
                kubernetes = "templates/**",
              },
              completion = true,
              hover = true,
              -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
            },
          },
        },
      },
    }

    nvim_lsp.ts_ls.setup {
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      cmd = { "typescript-language-server", "--stdio" },
      capabilities = capabilities,
      handlers = handlers,
      init_options = {
        preferences = {
          -- other preferences...
          importModuleSpecifierPreference = "relative",
          -- importModuleSpecifierEnding = "minimal",
        },
      },
    }

    nvim_lsp.eslint.setup {
      on_attach = function(client, bufnr)
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
      capabilities = capabilities,
    }

    nvim_lsp.jsonls.setup {}

    nvim_lsp.yamlls.setup {
      settings = {
        yaml = {
          schemaStore = {
            url = "https://www.schemastore.org/api/json/catalog.json",
            enable = true,
          },
        },
      },
      on_attach = on_attach,
    }

    nvim_lsp.tailwindcss.setup {}

    nvim_lsp.gopls.setup {
      cmd = { "gopls" },
      settings = {
        gopls = {
          analyses = {
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          experimentalPostfixCompletions = true,
          gofumpt = true,
          staticcheck = true,
          usePlaceholders = true,
        },
      },
      on_attach = on_attach,
    }
  end,
}
