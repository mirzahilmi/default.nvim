{
  plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = true;
      delete_to_trash = true;
      skip_confirm_for_simple_edits = true;
      float = {padding = 5;};
      view_options = {
        show_hidden = true;
        natural_order = true;
      };
      keymaps = {
        "<C-c>" = false;
        "<C-h>" = false;
        "<C-j>" = false;
        "<C-k>" = false;
        "<C-l>" = false;
        "<Esc>" = "actions.close";
        "<C-v>".__raw = ''{ "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" }'';
        "<C-x>".__raw = ''{ "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" }'';
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<CMD>Oil --float<CR>";
      options = {
        desc = "Open parent directory";
      };
    }
  ];
}
