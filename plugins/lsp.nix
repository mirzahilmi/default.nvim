{
  plugins = {
    cmp-nvim-lsp.enable = true;
    fidget.enable = true;
    lspkind.enable = true;
  };

  extraConfigLua = ''
    local lspconfig = require("lspconfig")
    lspconfig.gopls.setup {
      settings = {
        gopls = {
          gofumpt = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
          semanticTokens = true,
        },
      },
    }
    lspconfig.phpactor.setup {}
    lspconfig.nixd.setup {}
    lspconfig.lua_ls.setup {}
    lspconfig.arduino_language_server.setup {}
    lspconfig.yamlls.setup {
      settings = {
        yaml = {
          validate = true,
          hover = true,
          completion = true,
          format = {
            enable = true,
            bracketSpacing = true,
          },
        }
      }
    }
    lspconfig.basedpyright.setup {}
    lspconfig.denols.setup {
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    }
    lspconfig.biome.setup {
      filetypes = { "json", "jsonc" },
      single_file_support = true
    }
    lspconfig.terraformls.setup {
      filetypes = { "terraform", "terraform-vars", "tf", "tfvars" }
    }
    lspconfig.rust_analyzer.setup {
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          }
        }
      }
    }
  '';

  autoGroups = {
    "kickstart-lsp-attach" = {
      clear = true;
    };
  };

  plugins.lsp = {
    enable = true;
    servers = {
      # bashls.enable = true;
    };
    postConfig = ''
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end
    '';
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
        # Rename the variable under your cursor.
        #  Most Language Servers support renaming across files, etc.
        "<leader>rn" = {
          action = "rename";
          desc = "[R]e[N]ame";
        };
        # Execute a code action, usually your cursor needs to be on top of an error
        # or a suggestion from your LSP for this to activate.
        "<leader>ca" = {
          action = "code_action";
          desc = "[C]ode [A]ction";
        };
        # Opens a popup that displays documentation about the word under your cursor
        #  See `:help K` for why this keymap.
        "K" = {
          action = "hover";
          desc = "[K]Hover Documentation";
        };
      };
      extra = [
        # Jump to the definition of the word under your cusor.
        #  This is where a variable was first declared, or where a function is defined, etc.
        #  To jump back, press <C-t>.
        {
          mode = "n";
          key = "gd";
          action.__raw = "require('fzf-lua').lsp_definitions";
          options = {
            desc = "[G]oto [D]efinition";
          };
        }
        # Jump to the implementation of the word under your cursor.
        #  Useful when your language has ways of declaring types without an actual implementation.
        {
          mode = "n";
          key = "gI";
          action.__raw = "require('fzf-lua').lsp_implementations";
          options = {
            desc = "[G]oto [I]mplementation";
          };
        }
        # Fuzzy find all the symbols in your current document.
        #  Symbols are things like variables, functions, types, etc.
        {
          mode = "n";
          key = "<leader>ds";
          action.__raw = "require('fzf-lua').lsp_document_symbols";
          options = {
            desc = "[D]ocument [S]ymbols";
          };
        }
      ];
    };

    # This function gets run when an LSP attaches to a particular buffer.
    #   That is to say, every time a new file is opened that is associated with
    #   an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    #   function will be executred to configure the current buffer
    onAttach =
      #lua
      ''
        -- The following two autocommands are used to highlight references of the
        -- word under the cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event.buf }
            end,
          })
        end

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          vim.keymap.set('n', '<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })
          end, { desc = '[T]oggle Inlay [H]ints' })
        end

        -- workaround for gopls not supporting semanticTokensProvider
        -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
        if client.name == 'gopls' and not client.server_capabilities.semanticTokensProvider then
          local semantic = client.config.capabilities.textDocument.semanticTokens
          client.server_capabilities.semanticTokensProvider = {
            full = true,
            legend = {tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes},
            range = true,
          }
        end
      '';
  };
}
