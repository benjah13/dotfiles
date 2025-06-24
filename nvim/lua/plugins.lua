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
   -- to classify
  { import = "plugins.avante" },
  { import = "plugins.catpuccin" },
  { import = "plugins.gruvbox" },
  { import = "plugins.darkplus" },
  { import = "plugins.autopairs" },
  { import = "plugins.barbar" },
  { import = "plugins.copilot" },
  { import = "plugins.alpha" },
  { import = "plugins.hardtime" },
  { import = "plugins.dressing" },
  { import = "plugins.minifiles" },
  { import = "plugins.comment" },
  { import = "plugins.indentlines" },
  { import = "plugins.illuminate" },
  { import = "plugins.diffview" },
  { import = "plugins.ts-autotags" },
  { import = "plugins.vim-visual-multi" },
  { import = "plugins.lazygit" },
  { import = "plugins.neoscroll" },
  { import = "plugins.plenary" },
  { import = "plugins.treesitter" },
  { import = "plugins.lualine" },
  { import = "plugins.vimade" },
  { import = "plugins.web-devicons" },
  { import = "plugins.vim-tmux-navigator" },
  { import = "plugins.format-ts-errors" },
  { import = "plugins.codecompanion" },
  { import = "plugins.miniai" },
  { import = "plugins.precognition" },
  { import = "plugins.clipboard-history" },
  { import = "plugins.namu" },


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
  { import = "plugins.git.vim-fugitive" },
  { import = "plugins.git.git-conflict" },

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
  --  { import = "plugins.lsp.typescript-tools" },

  -- DAP
--  { import = 'plugins.dap.nvim-dap' },
}


