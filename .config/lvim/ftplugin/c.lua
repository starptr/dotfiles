local dap_install = require "dap-install"
dap_install.config("codelldb", {
  configurations = {
    {
      type = "codelldb",
      request = "launch",
      name = "Quick c run (codelldb)",
      program = function()
        return vim.fn.input('Path to build (w. symbols): ', vim.fn.getcwd(), 'file')
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = { "-f", "words.txt" }
    },
  }
})

-- TODO: automatically convert args (from another vim.fn.input) to array of strings
