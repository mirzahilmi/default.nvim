{
  plugins.fzf-lua = {
    enable = true;
    settings = {
      winopts = {
        backdrop = 100;
      };
      previewers.builtin.extensions = {
        "png" = ["chafa" "{file}"];
        "jpg" = ["chafa" "{file}"];
        "jpeg" = ["chafa" "{file}"];
        "gif" = ["chafa" "{file}"];
        "webp" = ["chafa" "{file}"];
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
          desc = "[S]earch [H]elp";
          silent = true;
        };
      };
      "<leader>sk" = {
        action = "keymaps";
        options = {
          desc = "[S]earch [K]eymap";
          silent = true;
        };
      };
    };
  };
}
