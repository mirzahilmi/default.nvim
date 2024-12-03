{
  plugins.fzf-lua = {
    enable = true;
    settings = {
      winopts = {
        backdrop = 100;
      };
    };
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
      "<leader>sh" = {
        action = "helptags";
        options = {
          desc = "[S]earch for [H]elp";
          silent = true;
        };
      };
    };
  };
}
