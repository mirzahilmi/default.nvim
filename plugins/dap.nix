{
  plugins.dap = {
    enable = true;
    extensions = {
      dap-ui.enable = true;
    };
  };
  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")

    dap.adapters.coreclr = {
      type = "executable",
      command = "netcoredbg",
      args = {"--interpreter=vscode"}
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }

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

    -- Maybe reference https://github.com/mfussenegger/nvim-dap/issues/1035
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
      options = {
        desc = "Toggle [B]reakpoint";
      };
    }
    {
      mode = "n";
      key = "<F1>";
      action = "<cmd>lua require('dap').continue()<CR>";
    }
    {
      mode = "n";
      key = "<F2>";
      action = "<cmd>lua require('dap').step_into()<CR>";
    }
    {
      mode = "n";
      key = "<F3>";
      action = "<cmd>lua require('dap').step_over()<CR>";
    }
    {
      mode = "n";
      key = "<F4>";
      action = "<cmd>lua require('dap').step_out()<CR>";
    }
    {
      mode = "n";
      key = "<F5>";
      action = "<cmd>lua require('dap').step_back()<CR>";
    }
    {
      mode = "n";
      key = "<F13>";
      action = "<cmd>lua require('dap').restart()<CR>";
    }
  ];
}
