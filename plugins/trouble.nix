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
      key = "<leader>tr";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = {
        desc = "[TR]ouble";
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
