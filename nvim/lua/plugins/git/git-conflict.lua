return {
  'akinsho/git-conflict.nvim', 
  version = "*", 
  config = function()
    require'git-conflict'.setup {
      highlights = { -- They must have background color, otherwise the default color will be used
        current = 'DiffText',
                    incoming = 'DiffAdd',
      }
    }
  end
}

