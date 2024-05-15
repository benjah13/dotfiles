return  {
  'akinsho/git-conflict.nvim', 
  config = function()
    require('git-conflict').setup({
      disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffAdd',
        current = 'DiffChange',
      }
    })
  end
}
