{
  plugins.fzf-lua = {
    enable = true;
    keymaps = {
      "<leader>sf" = {
        action = "files";
        options = {
          desc = "[S]earch [F]iles";
          silent = true;
        };
      };
      "<leader>sg" = {
        action = "live_grep";
        options = {
          desc = "[S]earch Live [G]rep";
          silent = true;
        };
      };
      "<leader>/" = {
        action = "lgrep_curbuf";
        options = {
          desc = "[S]earch Current Buffer[/]";
          silent = true;
        };
      };
    };
  };
}
