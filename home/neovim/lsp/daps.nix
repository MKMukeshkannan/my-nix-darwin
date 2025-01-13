{ pkgs, ... }: {
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins."nvim-dap" 
    pkgs.vimPlugins."nvim-dap-ui" 
  ];
  programs.nixvim.extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters.codelldb = {
      type = 'server',
      port = "$\{port\}",
      executable = {
        command = "/Users/mukeshkannan/my-nix-darwin/home/neovim/lsp/dap/codelldb/extension/adapter/codelldb", 
        args = {"--port", "$\{port\}"},
      }
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        host = "arm64",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
        cwd = '\$\{workspaceFolder\}',
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>db', function() dap.set_breakpoint() end)
    vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
  '';


}
