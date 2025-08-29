local dap = require "dap"
local dapui = require "dapui"
local utils = require "dap.utils"
local mason_registry = require "mason-registry"

dap.adapters = {
  ["node"] = {
    type = "executable",
    command = mason_registry.get_package("js-debug-adapter"):get_install_path() .. "/js-debug-adapter",
  },
}

dap.configurations["typescript"] = {
  {
    type = "node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    type = "node",
    request = "attach",
    name = "Attach to process ID",
    processId = utils.pick_process,
    cwd = "${workspaceFolder}",
  },
}

dapui.setup {
  icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
  controls = {
    icons = {
      pause = "⏸",
      play = "▶",
      step_into = "⏎",
      step_over = "⏭",
      step_out = "⏮",
      step_back = "b",
      run_last = "▶▶",
      terminate = "⏹",
      disconnect = "⏏",
    },
  },
}

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

local map = function(keys, func, desc)
  if desc then
    desc = "[D]ebugger: " .. desc
  end
  if keys then
    keys = "<leader>d" .. keys
  end
  vim.keymap.set("n", keys, func, { desc = desc })
end

map("c", dap.continue, "[C]ontinue")
-- TODO: is this really needed?
-- map("a", function()
--   require("dap").continue({ before = get_args })
-- end, "Run with [A]rgs")
map("i", dap.step_into, "Step [I]nto")
map("O", dap.step_out, "Step [O]ut")
map("o", dap.step_over, "Step Over")
map("C", function()
  require("dap").run_to_cursor()
end, "Run to [C]ursor")
map("g", function()
  require("dap").goto_()
end, "[G]o to line (no execute)")
map("b", dap.toggle_breakpoint, "Toggle [B]reakpoint")
map("B", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, "Set [B]reakpoint")
map("j", dap.down, "Down")
map("k", dap.up, "Up")
map("l", dap.run_last, "Run [L]ast")
map("p", dap.pause, "Pause")
map("r", function()
  dap.repl.toggle()
end, "Toggle REPL")
map("s", dap.session, "Session")
map("t", dap.terminate, "Terminate")
map("w", function()
  require("dap.ui.widgets").hover()
end, "Widgets")

map("u", function()
  dapui.toggle {
    -- Always open the nvim dap ui in the default sizes
    reset = true,
  }
end, "Toggle [U]I")
map("e", function()
  dapui.eval()
end, "Eval")

vim.api.nvim_set_keymap("n", "<F5>", [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
