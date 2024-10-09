{pkgs, ...}: {
  # Dependencies
  #
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extrapackages
  extraPackages = with pkgs; [
    # Used to format Lua code
    stylua
  ];

  # Autoformat
  # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = false;
      formatters = {
        php-cs-fixer = {
          command = "./vendor/bin/php-cs-fixer";
          args = ["fix" "$FILENAME"];
          stdin = false;
        };
        csharpier = {
          command = "dotnet-csharpier";
          args = ["--write-stdout"];
        };
      };
      formatters_by_ft = {
        lua = ["stylua"];
        nix = ["alejandra"];
        php = ["php-cs-fixer"];
        cs = ["csharpier"];
      };
      format_on_save =
        # Lua
        ''
          function(bufnr)
            local slow_format_filetypes = {cs}
            if slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end
            local disable_filetypes = { c = true, cpp = true }
            local lsp_format_opt
            if disable_filetypes[vim.bo[bufnr].filetype] then
              lsp_format_opt = 'never'
            else
              lsp_format_opt = 'fallback'
            end
            return {
              timeout_ms = 500,
              lsp_format = lsp_format_opt,
            }
          end
        '';
    };
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    {
      mode = "";
      key = "<leader>f";
      action.__raw =
        #Lua
        ''
          function()
            require('conform').format { async = true, lsp_fallback = true }
            vim.notify("Buffer Formatted", vim.log.levels.INFO)
          end
        '';
      options = {
        desc = "[F]ormat buffer";
      };
    }
  ];
}
