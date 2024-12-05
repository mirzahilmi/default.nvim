{
  plugins.trouble = {
    enable = true;
    settings = {
      warn_no_results = false;
      modes.lsp.win.position = "right";
    };
  };
  keymaps = [
    {
      key = "<leader>tt";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = {
        desc = "[T]oggle [T]rouble";
        silent = true;
      };
    }
    {
      key = "<leader>tq";
      action = "<cmd>Trouble qflist toggle<cr>";
      options = {
        desc = "[T]oggle [Q]uickfix List";
        silent = true;
      };
    }
  ];
}
