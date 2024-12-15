{pkgs, ...}: {
  plugins = {
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins;
        nvim-treesitter.passthru.allGrammars
        ++ [
          nvim-treesitter-parsers.hurl
        ];
      settings = {
        indent.enable = true;
        highlight = {
          enable = true;
          disable = ["dockerfile"];
        };
      };
    };
    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = {
            query = "@function.outer";
            desc = "Select outer part of a method/function definition";
          };
          "if" = {
            query = "@function.inner";
            desc = "Select inner part of a method/function definition";
          };
        };
      };
    };
  };
}
