
-- Simpler and more reliable setup
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", 
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- DON'T set log level here - it causes empty log files
      -- dap.set_log_level("DEBUG") -- This breaks logging
      
      -- Setup DAP UI
      dapui.setup({
        controls = {
          enabled = true,
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25,
            position = "bottom",
          },
        },
      })

      -- Setup virtual text
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        filter_references_pattern = '<module',
        virt_text_pos = 'eol',
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil
      })

      -- Manual Node.js adapter setup (more reliable)
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
      }

      -- Alternative: use pwa-node if you have it installed globally
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "js-debug-adapter", -- Make sure this is in your PATH
          args = { "${port}" },
        }
      }

      -- TypeScript/JavaScript configurations
      dap.configurations.typescript = {
        {
          name = "Launch TS with tsx (Recommended)",
          type = "node2", 
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          runtimeExecutable = "tsx",
          console = "integratedTerminal",
          skipFiles = { "<node_internals>/**" },
          sourceMaps = true,
        },
        {
          name = "Launch TS (ts-node)",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          runtimeExecutable = "node",
          runtimeArgs = { "-r", "ts-node/register" },
          console = "integratedTerminal",
          skipFiles = { "<node_internals>/**" },
          sourceMaps = true,
          outFiles = {
            "${workspaceFolder}/**/*.js",
            "!**/node_modules/**"
          },
        },
        {
          name = "Launch compiled JS (with source maps)",
          type = "node2",
          request = "launch",
          program = "${workspaceFolder}/dist/${fileBasenameNoExtension}.js",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          console = "integratedTerminal",
          skipFiles = { "<node_internals>/**" },
          outFiles = {
            "${workspaceFolder}/dist/**/*.js",
            "${workspaceFolder}/build/**/*.js",
            "${workspaceFolder}/out/**/*.js",
            "!**/node_modules/**"
          },
          preLaunchTask = "tsc: build", -- Optional: auto-compile before debug
        },
        {
          name = "Debug any JS file",
          type = "node2",
          request = "launch",
          program = function()
            local file = vim.fn.input("JS file path: ", vim.fn.getcwd() .. "/dist/", "file")
            return file
          end,
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          console = "integratedTerminal",
          skipFiles = { "<node_internals>/**" },
          outFiles = {
            "${workspaceFolder}/**/*.js",
            "!**/node_modules/**"
          },
        },
      }

      -- Copy config to javascript
      dap.configurations.javascript = dap.configurations.typescript

      -- Auto-open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Key mappings
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
      
      -- Debug helpers (safe logging commands)
      vim.keymap.set("n", "<leader>dl", function()
        local log_file = vim.fn.stdpath("cache") .. "/dap.log"
        vim.cmd("edit " .. log_file)
      end, { desc = "Debug: Open log file" })
      
      vim.keymap.set("n", "<leader>dL", function()
        -- Temporarily enable verbose logging for one session
        print("Enabling verbose logging for this session...")
        dap.set_log_level("DEBUG") -- Use INFO instead of DEBUG/TRACE
      end, { desc = "Debug: Enable verbose logging" })
      
      vim.keymap.set("n", "<leader>dc", function()
        print("Available adapters:")
        for name, _ in pairs(dap.adapters) do
          print("- " .. name)
        end
        print("Available configurations:")
        for ft, configs in pairs(dap.configurations) do
          print("- " .. ft .. " (" .. #configs .. " configs)")
        end
        print("Current log level: " .. (dap.get_log_level and dap.get_log_level() or "unknown"))
      end, { desc = "Debug: Show config info" })
    end,
  }
}

