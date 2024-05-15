return {

  "williamboman/mason.nvim",
  config = function()
    local status, mason = pcall(require, "mason")
    if not status then
      return
    end

    mason.setup {}
  end,
}
