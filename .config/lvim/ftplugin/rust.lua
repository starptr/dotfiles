local dap_install = require "dap-install"
-- dap_install.config("ccppr_vsc", {
--   adapters = {
--     type = "executable",
--   },
--   configurations = {
--     {
--       type = "cpptools",
--       request = "launch",
--       name = "Quick rust run",
--       program = function ()
--         return vim.fn.input('Path to exe: ', vim.fn.getcwd() .. '/target/debug/', 'file')
--       end,
--       cwd = "${workspaceFolder}",
--       stopOnEntry = true,
--       setupCommands = {
--         {
--           description = "Enable pretty-printing",
--           text = "-enable-pretty-printing",
--         }
--       }
--     },
--   }
-- })
dap_install.config("codelldb", {
  -- adapters = function(on_adapter)
  --   local stdout = vim.loop.new_pipe(false)
  --   local stderr = vim.loop.new_pipe(false)
  --   local cmd = require("dap-install.config.settings").options["installation_path"] .. "codelldb/extension/adapter/codelldb"
  --   local handle, pid_or_err
  --   local opts = {
  --     stdio = {nil, stdout, stderr},
  --     detached = true,
  --   }
  --   handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
  --     stdout:close()
  --     stderr:close()
  --     handle:close()
  --     if code ~= 0 then
  --       print("codelldb exited with code", code)
  --     end
  --   end)
  --   assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
  --   stdout:read_start(function(err, chunk)
  --     assert(not err, err)
  --     if chunk then
  --       local port = chunk:match('Listening on port (%d+)')
  --       if port then
  --         vim.schedule(function()
  --           on_adapter({
  --             type = 'server',
  --             host = '127.0.0.1',
  --             port = port
  --           })
  --         end)
  --       else
  --         vim.schedule(function()
  --           require("dap.repl").append(chunk)
  --         end)
  --       end
  --     end
  --   end)
  --   stderr:read_start(function(err, chunk)
  --     assert(not err, err)
  --     if chunk then
  --       vim.schedule(function()
  --         require("dap.repl").append(chunk)
  --       end)
  --     end
  --   end)
  -- end,
  configurations = {
    {
      type = "codelldb",
      request = "launch",
      name = "Quick rust run (codelldb)",
      program = function()
        return vim.fn.input('Path to build (w. symbols): ', vim.fn.getcwd() .. '/target/debug/', 'file')
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
})
