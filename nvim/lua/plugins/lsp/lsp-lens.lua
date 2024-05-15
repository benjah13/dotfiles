return {

  "VidocqH/lsp-lens.nvim",
  config = function()
    require("lsp-lens").setup {
      enable = false,
      include_declaration = false, -- Reference include declaration
      sections = { -- Enable / Disable specific request
        definition = false,
        references = true,
        implementation = false,
      },
      ignore_filetype = {
        -- "typescript",
      },
    }
  end,
}
