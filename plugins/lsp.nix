{
  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      lua_ls.enable = true;
      basedpyright = {
        enable = true;
        package = null;
      };
      terraformls = {
        enable = true;
        package = null;
      };
      rust_analyzer = {
        enable = true;
        package = null;
        installCargo = false;
        installRustc = false;
        settings = {
          "rust-analyzer" = {
            cargo.allFeatures = true;
          };
        };
      };
      denols = {
        enable = true;
        package = null;
        rootDir = ''
          function()
            local lspconfig = require("lspconfig")
            return lspconfig.util.root_pattern("deno.json", "deno.jsonc")
          end
        '';
      };
      phpactor = {
        enable = true;
        package = null;
      };
      yamlls = {
        enable = true;
        settings.yaml = {
          validate = true;
          hover = true;
          completion = true;
          format = {
            enable = true;
            bracketSpacing = true;
          };
        };
      };
      gopls = {
        enable = true;
        package = null;
        goPackage = null;
        settings.gopls = {
          gofumpt = true;
          codelenses = {
            gc_details = false;
            generate = true;
            regenerate_cgo = true;
            run_govulncheck = true;
            test = true;
            tidy = true;
            upgrade_dependency = true;
            vendor = true;
          };
          hints = {
            assignVariableTypes = true;
            compositeLiteralFields = true;
            compositeLiteralTypes = true;
            constantValues = true;
            functionTypeParameters = true;
            parameterNames = true;
            rangeVariableTypes = true;
          };
          analyses = {
            fieldalignment = true;
            nilness = true;
            unusedparams = true;
            unusedwrite = true;
            useany = true;
          };
          usePlaceholders = true;
          completeUnimported = true;
          staticcheck = true;
          directoryFilters = ["-.git" "-.vscode" "-.idea" "-.vscode-test" "-node_modules"];
          semanticTokens = true;
        };
      };
    };
    keymaps = {
      diagnostic = {
        "[d" = {
          action = "goto_prev";
          desc = "Go to previous [D]iagnostic message";
        };
        "]d" = {
          action = "goto_next";
          desc = "Go to next [D]iagnostic message";
        };
        "<leader>e" = {
          action = "open_float";
          desc = "Show diagnostic [E]rror messages";
        };
        "<leader>q" = {
          action = "setloclist";
          desc = "Open diagnostic [Q]uickfix list";
        };
      };
      lspBuf = {
        "<leader>rn" = {
          action = "rename";
          desc = "[R]e[N]ame";
        };
        "K" = {
          action = "hover";
          desc = "[K]Hover Documentation";
        };
      };
      extra = [
        {
          mode = "n";
          key = "gd";
          action.__raw = "require('fzf-lua').lsp_definitions";
          options = {
            desc = "[G]oto [D]efinition";
          };
        }
        {
          mode = "n";
          key = "gI";
          action.__raw = "require('fzf-lua').lsp_implementations";
          options = {
            desc = "[G]oto [I]mplementation";
          };
        }
        {
          mode = "n";
          key = "<leader>ds";
          action.__raw = "require('fzf-lua').lsp_document_symbols";
          options = {
            desc = "[D]ocument [S]ymbols";
          };
        }
        {
          mode = "n";
          key = "<leader>ca";
          action.__raw = "require('fzf-lua').lsp_code_actions";
          options = {
            desc = "[C]ode [A]ctions";
          };
        }
      ];
    };
  };
  autoCmd = [
    {
      event = ["FileType"];
      pattern = ["php"];
      command = "set iskeyword+=$";
    }
  ];
}
