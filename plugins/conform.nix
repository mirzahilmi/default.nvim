{pkgs, ...}: {
  extraPackages = with pkgs; [
    alejandra
    stylua
    nodePackages.sql-formatter
  ];

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
        sql = ["sql_formatter"];
      };
      format_on_save = ''
        function(bufnr)
          local slow_format_filetypes = { cs = true }
          local filetype = vim.bo[bufnr].filetype
          if slow_format_filetypes[filetype] then
            return
          end

          local disable_filetypes = { c = true, cpp = true }
          local lsp_format_opt
          if disable_filetypes[filetype] then
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

  keymaps = [
    {
      mode = "n";
      key = "<leader>f";
      action.__raw = ''
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
