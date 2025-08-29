return {
  "nvim-pack/nvim-spectre",
  config = function()
    require("spectre").setup {
      live_update = true,
    }
    -- Map Ctrl+Shift+F to toggle Spectre
    vim.keymap.set("n", "<D-S-f>", '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre (Global Search & Replace)",
    })

    -- Optional: Also map it in visual mode to search selected text
    vim.keymap.set("v", "<D-S-f>", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
      desc = "Search selected text with Spectre",
    })
  end,
}
