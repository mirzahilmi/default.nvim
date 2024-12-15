{
  plugins.fzf-lua = {
    enable = true;
    settings = {
      winopts = {
        backdrop = 100;
        height = 0.85;
        width = 0.80;
        row = 0.35;
        col = 0.55;
        treesitter = true;
        preview.default = "bat";
      };
      buffers = {
        formatter = "path.filename_first";
        preview_opts = "hidden";
        no_header = true;
        no_action_zz = true;
        winopts = {
          width = 0.4;
          height = 0.6;
        };
      };
      lsp.code_actions = {
        winopts.preview.default = "delta";
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
      "<leader>\"" = {
        action = "registers";
        options = {
          desc = "Search [\"]Registers";
          silent = true;
        };
      };
      "<leader><leader>" = {
        action = "buffers";
        options = {
          desc = "List Buffers";
          silent = true;
        };
      };
    };
  };
}
