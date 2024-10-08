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
    notifyOnError = false;
    formatOnSave = ''
      function(bufnr)
        -- Disable "format_on_save lsp_fallback" for lanuages that don't
        -- have a well standardized coding style. You can add additional
        -- lanuages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
        }
      end
    '';
    formattersByFt = {
      lua = ["stylua"];
      nix = ["alejandra"];
      php = ["php-cs-fixer"];
      # cs = ["csharpier"];
    };
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
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    {
      mode = "";
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
