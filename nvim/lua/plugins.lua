local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

return require("lazy").setup {
  -- Editor strcture
  { import = "plugins.alpha" },
  { import = "plugins.plenary" },
  { import = "plugins.lualine" },
  { import = "plugins.vim-tmux-navigator" },
  { import = "plugins.treesitter" },
  { import = "plugins.neoscroll" },
  { import = "plugins.web-devicons" },
  { import = "plugins.minifiles" },
  { import = "plugins.dressing" },
  { import = "plugins.indentlines" },
  { import = "plugins.barbar" },
  
  -- Editor features
  { import = "plugins.vimade" },
  { import = "plugins.clipboard-history" },
  { import = "plugins.illuminate" },
  { import = "plugins.namu" },
  { import = "plugins.format-ts-errors" },
  { import = "plugins.vim-visual-multi" },
  { import = "plugins.comment" },
  { import = "plugins.autopairs" },
  { import = "plugins.hardtime" },
  { import = "plugins.spectre" },

  -- themes
  { import = "plugins.darkplus" },
  { import = "plugins.gruvbox" },
  { import = "plugins.catpuccin" },

  -- AI
  { import = "plugins.copilot" },
  { import = "plugins.avante" },
  { import = "plugins.codecompanion" },

  -- telescope
  { import = "plugins.telescope.telescope" },
  { import = "plugins.telescope.telescope-fzf-native" },
  { import = "plugins.telescope.telescope-file-browser" },
  { import = "plugins.telescope.telescope-ui-select" },
  { import = "plugins.telescope.telescope-advanced-git-search" },

  -- cmp
  { import = "plugins.cmp.cmp-buffer" },
  { import = "plugins.cmp.cmp-cmdline" },
  { import = "plugins.cmp.cmp-nvim-lsp" },
  { import = "plugins.cmp.cmp-path" },
  { import = "plugins.cmp.cmp_luasnip" },
  { import = "plugins.cmp.nvim-cmp" },

  -- git
  { import = "plugins.git.git-nvim" },
  { import = "plugins.git.gitsigns" },
  { import = "plugins.lazygit" },
  { import = "plugins.git.vim-fugitive" },
  { import = "plugins.git.git-conflict" },
  { import = "plugins.diffview" },

  -- lsp
  { import = "plugins.lsp.mason" },
  { import = "plugins.lsp.mason-lspconfig" },
  { import = "plugins.lsp.nvim-lightbulb" },
  { import = "plugins.lsp.lsp_signature" },
  { import = "plugins.lsp.lspkind-nvim" },
  { import = "plugins.lsp.nvim-lspconfig" },
  { import = "plugins.lsp.luasnip" },
  { import = "plugins.lsp.lsp-lens" },
  { import = "plugins.lsp.nvim-lspconfig" },

  -- DAP
  --  { import = 'plugins.dap.nvim-dap' },
}


